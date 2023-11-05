//
//  MainView.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import SwiftUI
import Combine


public struct MainView: View {

  @ObservedObject var viewModel: MainViewModel
  let poiView: () -> PoiView

  public init(
    viewModel: MainViewModel,
    poiViewFactory: @escaping () -> PoiView
  ) {
    self.viewModel = viewModel
    self.poiView = poiViewFactory
  }

  public var body: some View {
    mainBody
      .onAppear {
        viewModel.testFetch()
      }
  }

  private var mainBody: some View {
    poiView()
  }
}
