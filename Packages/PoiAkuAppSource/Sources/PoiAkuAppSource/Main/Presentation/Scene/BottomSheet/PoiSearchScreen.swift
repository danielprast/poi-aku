//
//  PoiSearchScreen.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct PoiSearchScreen: View {

  @EnvironmentObject var poiViewModel: PoiViewModel
  let height: CGFloat

  public init(height: CGFloat) {
    self.height = height
  }

  public var body: some View {
    ContentView(
      inputTextSearch: $poiViewModel.searchText,
      height: height
    )
  }

  // MARK: - ⌘ Content View
  struct ContentView: View {

    @Binding var inputTextSearch: String
    let height: CGFloat

    init(
      inputTextSearch: Binding<String>,
      height: CGFloat
    ) {
      _inputTextSearch = inputTextSearch
      self.height = height
    }

    var body: some View {
//      VStack {
//        VStack {
//          Capsule()
//            .fill(Color.white)
//            .frame(width: 60, height: 4)
//
//          TextField("Search", text: $inputTextSearch)
//            .padding(.vertical,10)
//            .padding(.horizontal)
//            .background(BlurView(style: .dark))
//            .cornerRadius(10)
//            .colorScheme(.dark)
//            .padding(.top,10)
//        }
//        .frame(height: 100)
//
//        ScrollView(
//          .vertical,
//          showsIndicators: false,
//          content: {
//            poiContent()
//              .padding(.bottom)
//              .padding(.bottom,offset == -((height - 100) / 3) ? ((height - 100) / 1.5) : 0)
//          }
//        )
//      }
      poiContent()
    }

    @ViewBuilder
    private func poiContent() -> some View {
      Text("Joss")
    }

  }

}


// MARK: - ⌘ Preview
//struct PoiSearchScreen_Previews: PreviewProvider {
//
//  static var previews: some View {
//    PoiSearchScreen.ContentView(
//      inputTextSearch: .constant("Halo Dulur"),
//      height: 100
//    )
//    .background(BlurView(style: .dark))
//  }
//}
