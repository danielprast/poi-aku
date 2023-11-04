//
//  FakeRemoteDataSource.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public struct FakeRemoteDataSource {
  public init() {}
}


extension FakeRemoteDataSource: PoiReviewRemoteDataSource {

  public func fetchPoiReviews(params: [String : String]) -> AnyPublisher<PoiModule.Data.Response.JArray<PoiReviewResponseModel>, NError> {
    return Future<PoiModule.Data.Response.JArray<PoiReviewResponseModel>, NError> { promise in
      let jsonData = JsonResolver.loadJsonFromFile(with: "poi_review")
      guard
        let response = JsonResolver.decodeJson(from: jsonData, outputType: PoiRootListModel<PoiReviewResponseModel>.self)
      else {
        promise(.failure(NError.parsingError))
        return
      }
      promise(.success(response))
    }
    .eraseToAnyPublisher()
  }
}


extension FakeRemoteDataSource: PoiPhotoRemoteDataSource {

  public func fetchPoiPhoto(params: [String : String]) -> AnyPublisher<PoiModule.Data.Response.JArray<PoiPhotoResponseModel>, NError> {
    return Future<PoiModule.Data.Response.JArray<PoiPhotoResponseModel>, NError> { promise in
      let jsonData = JsonResolver.loadJsonFromFile(with: "poi_photos")
      guard
        let response = JsonResolver.decodeJson(from: jsonData, outputType: PoiRootListModel<PoiPhotoResponseModel>.self)
      else {
        promise(.failure(NError.parsingError))
        return
      }
      promise(.success(response))
    }
    .eraseToAnyPublisher()
  }
}


extension FakeRemoteDataSource: PoiDetailRemoteDataSource {

  public func fetchPoiDetail(params: [String : String]) -> AnyPublisher<PoiModule.Data.Response.JArray<PoiDetailResponseModel>, NError> {
    return Future<PoiModule.Data.Response.JArray<PoiDetailResponseModel>, NError> { promise in
      let jsonData = JsonResolver.loadJsonFromFile(with: "poi_detail")
      guard
        let response = JsonResolver.decodeJson(from: jsonData, outputType: PoiRootListModel<PoiDetailResponseModel>.self)
      else {
        promise(.failure(NError.parsingError))
        return
      }
      promise(.success(response))
    }
    .eraseToAnyPublisher()
  }

}


extension FakeRemoteDataSource: SearchPoiNearbyRemoteDataSource {

  public func fetchSearchPoiNearby(params: [String : String]) -> AnyPublisher<PoiModule.Data.Response.JArray<PoiDetailResponseModel>, NError> {
    shout("Search Poi Nearby Params", params)
    return Future<PoiModule.Data.Response.JArray<PoiDetailResponseModel>, NError> { promise in
      let jsonData = JsonResolver.loadJsonFromFile(with: "poi_search_nearby")
      guard
        let response = JsonResolver.decodeJson(from: jsonData, outputType: PoiRootListModel<PoiDetailResponseModel>.self)
      else {
        promise(.failure(NError.parsingError))
        return
      }
      promise(.success(response))
    }
    .eraseToAnyPublisher()
  }

}


extension FakeRemoteDataSource: SearchPoiInAreaRemoteDataSource {

  public func fetchSearchPoiInArea(params: [String : String]) -> AnyPublisher<PoiModule.Data.Response.JArray<PoiDetailResponseModel>, NError> {
    shout("Search Poi In Area Params", params)
    return Future<PoiModule.Data.Response.JArray<PoiDetailResponseModel>, NError> { promise in
      let jsonData = JsonResolver.loadJsonFromFile(with: "poi_search_in_area")
      guard
        let response = JsonResolver.decodeJson(from: jsonData, outputType: PoiRootListModel<PoiDetailResponseModel>.self)
      else {
        promise(.failure(NError.parsingError))
        return
      }
      promise(.success(response))
    }
    .eraseToAnyPublisher()
  }

}
