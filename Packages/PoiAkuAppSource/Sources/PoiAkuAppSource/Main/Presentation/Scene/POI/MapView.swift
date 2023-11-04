//
//  MapView.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import SwiftUI
import MapKit


public struct MapView: View {

  @EnvironmentObject var poiViewModel: PoiViewModel

  public init() {}

  public var body: some View {
    ZStack {
      MapViewHelper()
        .environmentObject(poiViewModel)
        .ignoresSafeArea()
    }
  }


}


struct MapViewHelper: UIViewRepresentable {
  @EnvironmentObject var poiViewModel: PoiViewModel
  func makeUIView(context: Context) -> MKMapView {
    return poiViewModel.mapView
  }
  func updateUIView(_ uiView: MKMapView, context: Context) {}
}



//struct MapView_Previews: PreviewProvider {
//  static var previews: some View {
//    MapView()
//  }
//}
