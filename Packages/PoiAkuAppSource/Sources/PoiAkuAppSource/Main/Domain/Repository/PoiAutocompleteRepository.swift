//
//  PoiAutocompleteRepository.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import Foundation
import Combine


public typealias PoiAutocompletesRepositoryData = AnyPublisher<PoiAutocompleteListEntity, NError>
public typealias PoiAutocompletesRepositoryDataTask = Future<PoiAutocompleteListEntity, NError>


public protocol PoiAutocompleteRepository {
  func getPoiAutocomplete(payload: PoiAutoCompletePayload) -> AnyPublisher<PoiAutocompleteListEntity, NError>
}


extension PoiRepositoryImpl: PoiAutocompleteRepository {

  public func getPoiAutocomplete(payload: PoiAutoCompletePayload) -> AnyPublisher<PoiAutocompleteListEntity, NError> {
    let connectionProblem = PoiAutocompletesRepositoryDataTask { promise in
      promise(.failure(.connectionProblem))
    }.eraseToAnyPublisher()

    let remoteTask: PoiAutocompletesRepositoryData = poiAutocompleteApi
      .fetchPoiAutoComplete(params: payload.requestParams)
      .flatMap { response -> PoiAutocompletesRepositoryData in
        let models = response.data.map { PoiAutocompleteItemEntity(response: $0) }
        return Just(PoiAutocompleteListEntity(autoCompletes: models))
          .setFailureType(to: NError.self)
          .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()

    return Just(networkConnectionChecker.isConnected)
      .setFailureType(to: NError.self)
      .eraseToAnyPublisher()
      .flatMap { isConnected -> PoiAutocompletesRepositoryData in
        if !isConnected {
          return connectionProblem
        }
        return remoteTask
      }.eraseToAnyPublisher()
  }
}
