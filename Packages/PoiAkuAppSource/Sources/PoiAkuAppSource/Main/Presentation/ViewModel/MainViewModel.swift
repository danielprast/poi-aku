//
//  MainViewModel.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import Foundation
import Combine


public class MainViewModel: ObservableObject {

  public init() {}

  public var task: AnyCancellable?

  public func testFetch() {
    let repo = DIC.shared.resolve(type: PoiAreaRepository.self)!
    let businessId = "0x89c259b5a9bd152b:0x31453e62a3be9f76"
    let searchPayload = PoiModule.Data.Payload.SearchPoi(keyword: "plumbers", lat: 37.359428, lng: -121.925337, zoom: 13)
    //task = remote.fetchSearchPoiInArea(params: param.requestParams)
    //let param = PoiModule.Data.Payload.PoiDetail(businessId: businessId)
    //task = remote.fetchPoiDetail(params: param.requestParams)
    //task = remote.fetchPoiPhoto(params: param.requestParams)
    //task = repo.getPoiPhotos(payload: PoiModule.Data.Payload.PoiPhoto(businessId: businessId))
    //task = repo.getPoiReviews(payload: PoiModule.Data.Payload.PoiReview(businessId: businessId))
    //task = repo.getPoiDetail(payload: PoiModule.Data.Payload.PoiDetail(businessId: businessId))
    //task = repo.getPoiNearby(payload: searchPayload)
    task = repo.getPoiInArea(payload: searchPayload)
      .subscribe(on: DispatchQueue.global(qos: .userInitiated))
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
      .sink(receiveCompletion: { completion in
        shout("completion", completion)
      }, receiveValue: { data in
        shout("poi data", data)
      })
  }
}
