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
  let poiAutocompleteRepository: PoiAutocompleteRepository

  public init(
    searchNearbyRepository: PoiNearbyRepository,
    searchInAreaRepository: PoiAreaRepository,
    poiAutocompleteRepository: PoiAutocompleteRepository
  ) {
    self.searchNearbyRepository = searchNearbyRepository
    self.searchInAreaRepository = searchInAreaRepository
    self.poiAutocompleteRepository = poiAutocompleteRepository
    coreLocation = .init()
    super.init()
    onInit()
  }

  deinit {
    inputTextTask?.cancel()
    searchNearbyTask?.cancel()
    searchInAreaTask?.cancel()
    getAutocompletesTask?.cancel()
  }

  // MARK: - ⌘ States
  @Published var mapView: MKMapView = .init()
  @Published var userLocation: CLLocation?
  @Published var searchText: String = ""
  @Published var poListEntity: PoiListEntity? = nil
  @Published var autocompleteListEntity: PoiAutocompleteListEntity? = nil
  @Published var displayPoiList: [PoiDetailEntity] = []
  @Published var displayAutocompleteList: [PoiAutocompleteItemEntity] = []
  @Published var searchMode: Bool = false
  @Published var isNearby: Bool = false
  var inputTextTask: AnyCancellable?
  var searchNearbyTask: AnyCancellable?
  var searchInAreaTask: AnyCancellable?
  var getAutocompletesTask: AnyCancellable?

  public func resetDisplayPoiList() {
    displayPoiList.removeAll()
  }

  public func resetDisplayAutocompleteList() {
    displayAutocompleteList.removeAll()
  }

  // MARK: - ⌘ UI Event

  public func submitTextSearch() {
    searchMode = false
  }

  public func onTapAutoCompleteItem(_ item: PoiAutocompleteItemEntity) {
    searchText = item.mainText
    resetDisplayPoiList()
    submitTextSearch()
    if isNearby {
      searchNearbyPoi()
      return
    }
    searchPoiAtSpecificArea()
  }

  // MARK: - ⌘ Use case

  public func getAutocompletes() {
    let payload = PoiAutoCompletePayload(keyword: searchText)
    getAutocompletesTask = poiAutocompleteRepository.getPoiAutocomplete(payload: payload)
      .subscribe(on: DispatchQueue.global(qos: .userInitiated))
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
      .sink { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          shout("failed to get autocompletes", error)
          break
        }
      } receiveValue: { [weak self] autocompletes in
        self?.handleReceived(autocompletes: autocompletes)
      }
  }

  public func searchNearbyPoi() {

  }

  public func searchPoiAtSpecificArea() {
    let searchPayload = PoiModule.Data.Payload.SearchPoi(keyword: searchText, lat: 37.359428, lng: -121.925337, zoom: 13)
    searchInAreaTask = searchInAreaRepository.getPoiInArea(payload: searchPayload)
      .subscribe(on: DispatchQueue.global(qos: .userInitiated))
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
      .sink(receiveCompletion: { completion in
        shout("completion", completion)
      }, receiveValue: { [weak self] data in
        shout("poi area data", data)
        self?.poListEntity = data
        self?.displayPoiList = data.poiList
      })
  }

  // MARK: - ⌘

  fileprivate func onInit() {
    coreLocation.delegate = self
    mapView.delegate = self
    handleSearchTextBehavior()
  }

  fileprivate func handleSearchTextBehavior() {
    inputTextTask = $searchText
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .removeDuplicates()
      .sink(
        receiveValue: { [weak self] value in
          self?.handleReceived(text: value)
        }
      )
  }

  fileprivate func handleReceived(autocompletes: PoiAutocompleteListEntity) {
    autocompleteListEntity = autocompletes
    resetDisplayAutocompleteList()
    displayAutocompleteList.append(PoiAutocompleteItemEntity(text: searchText, secondaryText: "Search nearby", isNearby: true))
    displayAutocompleteList.append(contentsOf: autocompletes.autoCompletes)
  }

  fileprivate func handleReceived(text: String) {
    if text.isEmpty {
      return
    }

    shout("fetch search api", searchText)
    getAutocompletes()
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
