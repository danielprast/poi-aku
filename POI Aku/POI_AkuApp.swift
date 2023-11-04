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
      injectionContainer.makeRootView()
    }
  }
}


struct MyPreviewProvider_Previews: PreviewProvider {
  static var previews: some View {
    AppDependencyContainer().makeRootView()
  }
}
