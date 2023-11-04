//
//  BottomSheetView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct BottomSheetView: View {

  @EnvironmentObject var poiViewModel: PoiViewModel
  @GestureState var gestureOffset: CGFloat = 0
  @State var offset: CGFloat = 0
  @State var lastOffset: CGFloat = 0

  public init() {}

  public var body: some View {
    GeometryReader { proxy -> AnyView in
      return AnyView(anyViewContent(geo: proxy))
    }
    .ignoresSafeArea(.all, edges: .bottom)
  }

  @ViewBuilder
  private func anyViewContent(geo: GeometryProxy) -> some View {
    let height = geo.frame(in: .global).height

    ZStack {
      BlurView(style: .systemThinMaterialDark)
        .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 30))

      poiScreen(geo: geo)
        .padding(.horizontal)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    .offset(y: height - 100)
    .offset(y: -offset > 0 ? -offset <= (height - 100) ? offset : -(height - 100) : 0)
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
            let maxHeight = height - 100
            withAnimation{
              // Logic COnditions For Moving States...
              // Up down or mid....
              if -offset > 100 && -offset < maxHeight / 2{
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
  private func poiScreen(geo: GeometryProxy) -> some View {
    let height = geo.frame(in: .global).height
    VStack {
      VStack {
        Capsule()
          .fill(Color.white)
          .frame(width: 60, height: 4)

        TextField("Search", text: $poiViewModel.searchText)
          .padding(.vertical,10)
          .padding(.horizontal)
          .background(BlurView(style: .dark))
          .cornerRadius(10)
          .colorScheme(.dark)
          .padding(.top,10)
      }
      .frame(height: 100)

      ScrollView(
        .vertical,
        showsIndicators: false,
        content: {
          poiContent()
            .padding(.bottom)
            .padding(.bottom,offset == -((height - 100) / 3) ? ((height - 100) / 1.5) : 0)
        }
      )
    }
  }

  @ViewBuilder
  private func poiContent() -> some View {

  }

  func onChange() {
    DispatchQueue.main.async {
      self.offset = gestureOffset + lastOffset
    }
  }

  // Blur Radius For BG>..
  func getBlurRadius() -> CGFloat {

    let progress = -offset / (UIScreen.main.bounds.height - 100)

    return progress * 30 <= 30 ? progress * 30 : 30
  }
}
