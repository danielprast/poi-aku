//
//  POI_AkuApp.swift
//  POI Aku
//
//  Created by Daniel Prastiwa on 03/11/23.
//

import SwiftUI
import PoiAkuAppSource


@main
struct POI_AkuApp: App {

  let injectionContainer: AppDependencyContainer

  init() {
    injectionContainer = AppDependencyContainer()
  }

  var body: some Scene {
    WindowGroup {
      MainView(viewModel: MainViewModel())
    }
  }
}
