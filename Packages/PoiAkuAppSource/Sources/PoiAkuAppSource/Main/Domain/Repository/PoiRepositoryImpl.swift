//
//  PoiRepositoryImpl.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public struct PoiRepositoryImpl {
  public let networkConnectionChecker: NetworkConnectionChecker
  public let poiPhotoApi: PoiPhotoRemoteDataSource

  public init(
    networkConnectionChecker: NetworkConnectionChecker,
    poiPhotoApi: PoiPhotoRemoteDataSource
  ) {
    self.networkConnectionChecker = networkConnectionChecker
    self.poiPhotoApi = poiPhotoApi
  }
}
