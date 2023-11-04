//
//  PoiViewModel.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import Foundation
import CoreLocation
import Combine
import MapKit


public class PoiViewModel: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate {

  // MARK: - ⌘ Dependencies
  let coreLocation: CLLocationManager

  public override init() {
    coreLocation = .init()
    super.init()
    coreLocation.delegate = self
    mapView.delegate = self
    handleSearchTextBehavior()
  }

  // MARK: - ⌘ States
  @Published var mapView: MKMapView = .init()
  @Published var userLocation: CLLocation?
  @Published var searchText: String = ""
  var cancellable: AnyCancellable?

  // MARK: - ⌘

  fileprivate func handleSearchTextBehavior() {
    cancellable = $searchText
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .removeDuplicates()
      .sink(
        receiveValue: { value in
          if value != ""{
            // fetch search poi
            shout("fetch search api", "JOSS!!")
          }
        }
      )
  }

  // MARK: - ⌘ Map View Delegate
  public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    return nil
  }

  public func mapView(
    _ mapView: MKMapView,
    annotationView view: MKAnnotationView,
    didChange newState: MKAnnotationView.DragState,
    fromOldState oldState: MKAnnotationView.DragState
  ) {

  }

  // MARK: - ⌘ CLLocation Delegate
  public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    shout("location manager error", error)
  }

  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let currentLocation = locations.last else{return}
    self.userLocation = currentLocation
  }

  public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    switch manager.authorizationStatus{
    case .authorizedAlways: manager.requestLocation()
    case .authorizedWhenInUse: manager.requestLocation()
    case .denied: handleLocationErrorLocationAuth()
    case .notDetermined: manager.requestWhenInUseAuthorization()
    default: ()
    }
  }

  fileprivate func handleLocationErrorLocationAuth() {
    shout("location manager auth error", "permission denied")
  }
}
