//
//  DetailScreen.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct DetailScreen: View {

  @EnvironmentObject var poiViewModel: PoiViewModel
  @Environment(\.dismiss) private var dismissable

  public init() {}

  public var body: some View {
    ZStack {
      Color.pink
      Text("Detail Screen")
      VStack {
        Button("Tutup", action: {
          dismissable.callAsFunction()
        })
        Spacer()
      }
    }
  }
}
