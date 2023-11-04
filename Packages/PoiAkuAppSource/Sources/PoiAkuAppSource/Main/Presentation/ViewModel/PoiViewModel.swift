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
  let searchNearbyRepository: PoiNearbyRepository
  let searchInAreaRepository: PoiAreaRepository

  public init(
    searchNearbyRepository: PoiNearbyRepository,
    searchInAreaRepository: PoiAreaRepository
  ) {
    self.searchNearbyRepository = searchNearbyRepository
    self.searchInAreaRepository = searchInAreaRepository
    coreLocation = .init()
    super.init()
    onInit()
  }

  deinit {
    cancellable?.cancel()
    searchNearbyTask?.cancel()
    searchInAreaTask?.cancel()
  }

  // MARK: - ⌘ States
  @Published var mapView: MKMapView = .init()
  @Published var userLocation: CLLocation?
  @Published var searchText: String = ""
  var cancellable: AnyCancellable?
  var searchNearbyTask: AnyCancellable?
  var searchInAreaTask: AnyCancellable?

  // MARK: - ⌘ Use case

  public func searchNearbyPoi() {

  }

  public func searchPoiAtSpecificArea() {
    let searchPayload = PoiModule.Data.Payload.SearchPoi(keyword: "plumbers", lat: 37.359428, lng: -121.925337, zoom: 13)
    searchInAreaTask = searchInAreaRepository.getPoiInArea(payload: searchPayload)
      .subscribe(on: DispatchQueue.global(qos: .userInitiated))
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
      .sink(receiveCompletion: { completion in
        shout("completion", completion)
      }, receiveValue: { data in
        shout("poi area data", data)
      })
  }

  // MARK: - ⌘

  fileprivate func onInit() {
    coreLocation.delegate = self
    mapView.delegate = self
    handleSearchTextBehavior()
  }

  fileprivate func handleSearchTextBehavior() {
    cancellable = $searchText
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .removeDuplicates()
      .sink(
        receiveValue: { [weak self] value in
          self?.handleReceived(text: value)
        }
      )
  }

  fileprivate func handleReceived(text: String) {
    if text.isEmpty {
      return
    }
    // fetch search poi
    shout("fetch search api", searchText)
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
