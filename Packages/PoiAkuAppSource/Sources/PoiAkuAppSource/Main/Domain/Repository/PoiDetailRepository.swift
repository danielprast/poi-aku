//
//  PoiDetailRepository.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public typealias PoiDetailRepositoryData = AnyPublisher<PoiDetailEntity, NError>
public typealias PoiDetailRepositoryDataTask = Future<PoiDetailEntity, NError>


public protocol PoiDetailRepository {
  func getPoiDetail(payload: PoiModule.Data.Payload.PoiDetail) -> PoiDetailRepositoryData
}


// MARK: ⌘ Poi Detail Repository
extension PoiRepositoryImpl: PoiDetailRepository {

  public func getPoiDetail(payload: PoiModule.Data.Payload.PoiDetail) -> PoiDetailRepositoryData {
    let connectionProblem = PoiDetailRepositoryDataTask { promise in
      promise(.failure(.connectionProblem))
    }.eraseToAnyPublisher()

    let remoteTask: PoiDetailRepositoryData = poiDetailApi
      .fetchPoiDetail(params: payload.requestParams)
      .flatMap { response -> PoiDetailRepositoryData in
        let models = response.data.map { PoiModule.Data.Model.PoiDetail(response: $0) }
        return Just(models[0])
          .setFailureType(to: NError.self)
          .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()

    return Just(networkConnectionChecker.isConnected)
      .setFailureType(to: NError.self)
      .eraseToAnyPublisher()
      .flatMap { isConnected -> PoiDetailRepositoryData in
        if !isConnected {
          return connectionProblem
        }
        return remoteTask
      }.eraseToAnyPublisher()
  }

}
