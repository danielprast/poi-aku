//
//  PoiPhotoRepository.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public typealias PoiPhotosRepositoryData = AnyPublisher<PoiPhotosEntity, NError>
public typealias PoiPhotosRepositoryDataTask = Future<PoiPhotosEntity, NError>


public protocol PoiPhotoRepository {
  func getPoiPhotos(payload: PoiModule.Data.Payload.PoiPhoto) -> PoiPhotosRepositoryData
}


// MARK: ⌘ Poi Photo Repository
extension PoiRepositoryImpl: PoiPhotoRepository {

  public func getPoiPhotos(payload: PoiModule.Data.Payload.PoiPhoto) -> PoiPhotosRepositoryData {
    let connectionProblem = PoiPhotosRepositoryDataTask { promise in
      promise(.failure(.connectionProblem))
    }.eraseToAnyPublisher()

    let remoteTask: PoiPhotosRepositoryData = poiPhotoApi
      .fetchPoiPhoto(params: payload.requestParams)
      .flatMap { response -> PoiPhotosRepositoryData in
        let photos = response.data.map { PoiModule.Data.Model.PoiPhoto(response: $0) }
        let entity = PoiPhotosEntity(photos: photos)
        return Just(entity)
          .setFailureType(to: NError.self)
          .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()

    return Just(networkConnectionChecker.isConnected)
      .setFailureType(to: NError.self)
      .eraseToAnyPublisher()
      .flatMap { isConnected -> PoiPhotosRepositoryData in
        if !isConnected {
          return connectionProblem
        }
        return remoteTask
      }.eraseToAnyPublisher()
  }
}
