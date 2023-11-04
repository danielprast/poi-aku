//
//  PoiRepositoryImpl.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public struct PoiRepositoryImpl {
  public let networkConnectionChecker: NetworkConnectionChecker
  public let poiPhotoApi: PoiPhotoRemoteDataSource
  public let poiReviewsApi: PoiReviewRemoteDataSource
  public let poiDetailApi: PoiDetailRemoteDataSource
  public let poiNearbyApi: SearchPoiNearbyRemoteDataSource
  public let poiAreaApi: SearchPoiInAreaRemoteDataSource
  public let poiAutocompleteApi: PoiAutoCompleteRemoteDataSource

  public init(
    networkConnectionChecker: NetworkConnectionChecker,
    poiPhotoApi: PoiPhotoRemoteDataSource,
    poiReviewsApi: PoiReviewRemoteDataSource,
    poiDetailApi: PoiDetailRemoteDataSource,
    poiNearbyApi: SearchPoiNearbyRemoteDataSource,
    poiAreaApi: SearchPoiInAreaRemoteDataSource,
    poiAutocompleteApi: PoiAutoCompleteRemoteDataSource
  ) {
    self.networkConnectionChecker = networkConnectionChecker
    self.poiPhotoApi = poiPhotoApi
    self.poiReviewsApi = poiReviewsApi
    self.poiDetailApi = poiDetailApi
    self.poiNearbyApi = poiNearbyApi
    self.poiAreaApi = poiAreaApi
    self.poiAutocompleteApi = poiAutocompleteApi
  }
}
