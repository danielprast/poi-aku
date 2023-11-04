//
//  BottomSheetView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct BottomSheetView<Content> : View where Content : View {

  @GestureState var gestureOffset: CGFloat = 0
  @State var offset: CGFloat = 0
  @State var lastOffset: CGFloat = 0
  @FocusState private var isFocused: Bool
  @Binding var searchText: String

  let defaultSpacing: CGFloat = 100
  let bottomContentSpacing: CGFloat = 20.0

  @ViewBuilder let content: Content

  public init(
    searchText: Binding<String>,
    @ViewBuilder content: () -> Content
  ) {
    self._searchText = searchText
    self.content = content()
  }

  public var body: some View {
    GeometryReader { proxy -> AnyView in
      return AnyView(anyViewContent(geo: proxy))
    }
    .ignoresSafeArea(.all, edges: .bottom)
    .onTapGesture {
      isFocused = false
    }
  }

  @ViewBuilder
  private func anyViewContent(geo: GeometryProxy) -> some View {
    let height = geo.frame(in: .global).height

    ZStack {
      BlurView(style: .systemThinMaterialDark)
        .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 30))

      sheetContent(geo: geo)
        .padding(.horizontal)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    .offset(y: height - defaultSpacing)
    .offset(y: -offset > 0 ? -offset <= (height - defaultSpacing) ? offset : -(height - defaultSpacing) : 0)
    .gesture(
      DragGesture()
        .updating(
          $gestureOffset,
          body: { value, out, _ in
            out = value.translation.height
            onChange()
          }
        )
        .onEnded(
          { value in
            let maxHeight = height - defaultSpacing
            withAnimation{
              // Logic COnditions For Moving States...
              // Up down or mid....
              if -offset > defaultSpacing && -offset < maxHeight / 2 {
                // Mid....
                offset = -(maxHeight / 3)
              }
              else if -offset > maxHeight / 2{
                offset = -maxHeight
              }
              else{
                offset = 0
              }
            }
            // Storing Last Offset..
            // So that the gesture can contiue from the last position...
            lastOffset = offset
          }
        )
    )
  }

  @ViewBuilder
  private func sheetContent(geo: GeometryProxy) -> some View {
    let height = geo.frame(in: .global).height
    VStack {
      VStack {
        Capsule()
          .fill(Color.white)
          .frame(width: 60, height: 4)

        TextField(
          "Search",
          text: $searchText
        )
        .focused($isFocused)
        .onChange(of: isFocused, perform: { focused in
          if !focused {
            shout("TF", "TF Focus Removed")
            return
          }
          shout("TF", "TF Focused")
          let maxHeight = height - defaultSpacing
          animateBottomSheetToTargetHeight(size: maxHeight)
        })
        .padding(.vertical,10)
        .padding(.horizontal)
        .background(BlurView(style: .dark))
        .cornerRadius(10)
        .colorScheme(.dark)
        .padding(.top,10)
      }
      .frame(height: defaultSpacing)

      ScrollView(
        .vertical,
        showsIndicators: false,
        content: {
          content
            .padding(.bottom)
            .padding(.bottom, calculateOffset(by: height))
        }
      )
    }
  }

  private func animateBottomSheetToTargetHeight(size: CGFloat) {
    withAnimation {
      offset = -size
    }
    lastOffset = offset
  }

  private func calculateOffset(by height: CGFloat) -> CGFloat {
    let conditionMet = -((height - defaultSpacing) / 3)
    if offset == conditionMet {
      return ((height - defaultSpacing) / 1.5)
    }
    return bottomContentSpacing
  }

  private func onChange() {
    if isFocused {
      isFocused.toggle()
    }
    DispatchQueue.main.async {
      self.offset = gestureOffset + lastOffset
    }
  }

  private func getBlurRadius() -> CGFloat {
    let progress = -offset / (UIScreen.main.bounds.height - defaultSpacing)
    return progress * 30 <= 30 ? progress * 30 : 30
  }
}
