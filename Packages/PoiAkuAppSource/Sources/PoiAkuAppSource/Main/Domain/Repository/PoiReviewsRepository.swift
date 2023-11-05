//
//  PoiReviewsRepository.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public typealias PoiReviewsRepositoryData = AnyPublisher<PoiReviewsEntity, NError>
public typealias PoiReviewsRepositoryDataTask = Future<PoiReviewsEntity, NError>


public protocol PoiReviewsRepository {
  func getPoiReviews(payload: PoiModule.Data.Payload.PoiReview) -> PoiReviewsRepositoryData
}


// MARK: ⌘ Poi Reviews Repository
extension PoiRepositoryImpl: PoiReviewsRepository {

  public func getPoiReviews(payload: PoiModule.Data.Payload.PoiReview) -> PoiReviewsRepositoryData {
    let connectionProblem = PoiReviewsRepositoryDataTask { promise in
      promise(.failure(.connectionProblem))
    }.eraseToAnyPublisher()

    let remoteTask: PoiReviewsRepositoryData = poiReviewsApi
      .fetchPoiReviews(params: payload.requestParams)
      .flatMap { response -> PoiReviewsRepositoryData in
        let reviews = response.data.map { PoiModule.Data.Model.PoiReview(response: $0) }
        let entity = PoiReviewsEntity(reviews: reviews)
        return Just(entity)
          .setFailureType(to: NError.self)
          .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()

    return Just(networkConnectionChecker.isConnected)
      .setFailureType(to: NError.self)
      .eraseToAnyPublisher()
      .flatMap { isConnected -> PoiReviewsRepositoryData in
        if !isConnected {
          return connectionProblem
        }
        return remoteTask
      }.eraseToAnyPublisher()
  }

}
