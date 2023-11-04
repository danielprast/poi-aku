//
//  PoiView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI


public struct PoiView: View {

  @ObservedObject var viewModel: PoiViewModel

  public init(viewModel: PoiViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    PoiView.contentView()
  }

  @ViewBuilder
  public static func contentView() -> some View {
    ZStack {
      Color.teal
      Text("POI View!")
        .font(.largeTitle)
    }
  }
}


struct PoiView_Previews: PreviewProvider {
  static var previews: some View {
    PoiView.contentView()
  }
}
