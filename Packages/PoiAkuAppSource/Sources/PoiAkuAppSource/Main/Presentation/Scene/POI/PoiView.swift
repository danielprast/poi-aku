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
    ZStack {
      spacerView
      BottomSheetView()
        .environmentObject(viewModel)
    }
    .background(
      MapView()
        .environmentObject(viewModel)
        .edgesIgnoringSafeArea(.all)
    )
    .onAppear {
      titleText = "Joss Gandoss"
    }
  }

  private var spacerView: some View {
    HStack {
      Spacer()
      VStack {
        Spacer()
      }
    }
  }

}
