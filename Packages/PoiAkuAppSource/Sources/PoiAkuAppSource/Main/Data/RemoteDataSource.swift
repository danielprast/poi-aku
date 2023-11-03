//
//  RemoteDataSource.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import Combine


public struct RemoteDataSourceImpl {

  let networkService: NetworkManager

  public init(networkService: NetworkManager) {
    self.networkService = networkService
  }

}


// MARK: - ⌘ Search Poi In Area
public protocol SearchPoiInAreaRemoteDataSource {
  func fetchSearchPoiInArea(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiSearchInAreaResponseModel>, NError>
}

extension RemoteDataSourceImpl: SearchPoiInAreaRemoteDataSource {

  public func fetchSearchPoiInArea(params: [String : String]) -> AnyPublisher<PoiRootListModel<PoiSearchInAreaResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiSearchInAreaResponseModel>.self,
      url: NetworkManager.makeUrl(
        baseURL: AppConfig.baseURL,
        path: Endpoints.searchInArea.path,
        queryItems: params
      )!,
      headers: AppConfig.headers
    )
  }
}


// MARK: - ⌘ Search Poi Nearby
public protocol SearchPoiNearbyRemoteDataSource {
  func fetchSearchPoiNearby(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiSearchNearbyResponseModel>, NError>
}

extension RemoteDataSourceImpl: SearchPoiNearbyRemoteDataSource {

  public func fetchSearchPoiNearby(params: [String : String]) -> AnyPublisher<PoiRootListModel<PoiSearchNearbyResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiSearchNearbyResponseModel>.self,
      url: NetworkManager.makeUrl(
        baseURL: AppConfig.baseURL,
        path: Endpoints.searchNearby.path,
        queryItems: params
      )!,
      headers: AppConfig.headers
    )
  }
}


// MARK: - ⌘ POI Detail
public protocol PoiDetailRemoteDataSource {
  func fetchPoiDetail(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiSearchNearbyResponseModel>, NError>
}
