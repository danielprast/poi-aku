//
//  PoiNearbyRepository.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public typealias PoiListRepositoryData = AnyPublisher<PoiListEntity, NError>
public typealias PoiListRepositoryDataTask = Future<PoiListEntity, NError>


public protocol PoiNearbyRepository {
  func getPoiNearby(payload: PoiModule.Data.Payload.SearchPoi) -> PoiListRepositoryData
}


extension PoiRepositoryImpl: PoiNearbyRepository {

  public func getPoiNearby(payload: PoiModule.Data.Payload.SearchPoi) -> PoiListRepositoryData {
    let connectionProblem = PoiListRepositoryDataTask { promise in
      promise(.failure(.connectionProblem))
    }.eraseToAnyPublisher()

    let remoteTask: PoiListRepositoryData = poiNearbyApi
      .fetchSearchPoiNearby(params: payload.requestParams)
      .flatMap { response -> PoiListRepositoryData in
        let models = response.data.map { PoiModule.Data.Model.PoiDetail(response: $0) }
        return Just(PoiListEntity(poiList: models))
          .setFailureType(to: NError.self)
          .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()

    return Just(networkConnectionChecker.isConnected)
      .setFailureType(to: NError.self)
      .eraseToAnyPublisher()
      .flatMap { isConnected -> PoiListRepositoryData in
        if !isConnected {
          return connectionProblem
        }
        return remoteTask
      }.eraseToAnyPublisher()
  }
}
