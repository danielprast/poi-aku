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
    PoiDetailContentView(
      onCloseAction: {
        poiViewModel.resetBussinessId()
        dismissable.callAsFunction()
      }
    )
    .onAppear {
        poiViewModel.getPoiDetail()
      }
  }

  // MARK: - ⌘ Content View
  struct PoiDetailContentView: View {

    let onCloseAction: () -> Void

    var body: some View {
      ZStack {
        Color.colorHex(.white)
        Text("Detail Screen")
        VStack {
          HStack {

            Spacer()
          }
          Button("Tutup", action: {
            onCloseAction()

          })
//          ScrollView(.horizontal, showsIndicators: false) {
//            LazyHStack(alignment: .firstTextBaseline, spacing: 16) {
//              ForEach(home.items, id: \.id) { item in
//
//              }
//            }
//            .padding(.horizontal, 24)
//            .padding(.bottom, 24)
//          }

          Spacer()
        }
      }
    }
  }
}


struct PoiDetailScreen_Previews: PreviewProvider {
  static var previews: some View {
    DetailScreen.PoiDetailContentView(
      onCloseAction: {}
    )
  }
}
