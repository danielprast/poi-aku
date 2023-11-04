//
//  PoiView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct PoiView: View {

  @StateObject var viewModel: PoiViewModel
  @State var titleText: String = ""

  public init(viewModel: PoiViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }

  public var body: some View {
    ContentView(titleText: $titleText)
      .background(
        MapView()
          .environmentObject(viewModel)
          .edgesIgnoringSafeArea(.all)
      )
      .onAppear {
        titleText = "Joss Gandoss"
        viewModel.searchPoiAtSpecificArea()
      }

  }

  // MARK: - ⌘ Content View
  struct ContentView: View {

    @Binding var titleText: String

    var body: some View {
      ZStack {
        spacerView
        Text(titleText)
          .font(.largeTitle)
      }

    }

    var spacerView: some View {
      HStack {
        Spacer()
        VStack {
          Spacer()
        }
      }
    }

  }

}


// MARK: - ⌘ Preview
struct PoiView_Previews: PreviewProvider {
  static var previews: some View {
    //PoiView.contentView(titleText: "Joss Gandoss")
    PoiView.ContentView(titleText: .constant("Halo Dulur"))
  }
}
