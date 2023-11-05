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
    mainBody
      .onAppear {
        poiViewModel.getPoiDetail()
      }
  }

  public var mainBody: some View {
    ZStack {
      Color.clear
      Text("Detail Screen")
      VStack {
        Button("Tutup", action: {
          poiViewModel.resetBussinessId()
          dismissable.callAsFunction()
        })
//        ScrollView(.horizontal, showsIndicators: false) {
//          LazyHStack(alignment: .firstTextBaseline, spacing: 16) {
//            ForEach(home.items, id: \.id) { item in
//              createRowView(from: home, item: item)
//            }
//          }
//          .padding(.horizontal, 24)
//          .padding(.bottom, 24)
//        }

        Spacer()
      }
    }
  }
}
