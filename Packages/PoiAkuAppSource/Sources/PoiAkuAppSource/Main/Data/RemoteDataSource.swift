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
  func fetchSearchPoiInArea(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiDetailResponseModel>, NError>
}

extension RemoteDataSourceImpl: SearchPoiInAreaRemoteDataSource {

  public func fetchSearchPoiInArea(params: [String : String]) -> AnyPublisher<PoiRootListModel<PoiDetailResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiDetailResponseModel>.self,
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
  func fetchSearchPoiNearby(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiDetailResponseModel>, NError>
}

extension RemoteDataSourceImpl: SearchPoiNearbyRemoteDataSource {

  public func fetchSearchPoiNearby(params: [String : String]) -> AnyPublisher<PoiRootListModel<PoiDetailResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiDetailResponseModel>.self,
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
  func fetchPoiDetail(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiDetailResponseModel>, NError>
}


extension RemoteDataSourceImpl: PoiDetailRemoteDataSource {

  public func fetchPoiDetail(params: [String : String]) -> AnyPublisher<PoiRootListModel<PoiDetailResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiDetailResponseModel>.self,
      url: NetworkManager.makeUrl(
        baseURL: AppConfig.baseURL,
        path: Endpoints.businessDetails.path,
        queryItems: params
      )!,
      headers: AppConfig.headers
    )
  }
}


// MARK: - ⌘ POI Photo
public protocol PoiPhotoRemoteDataSource {
  func fetchPoiPhoto(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiPhotoResponseModel>, NError>
}


extension RemoteDataSourceImpl: PoiPhotoRemoteDataSource {

  public func fetchPoiPhoto(params: [String : String]) -> AnyPublisher<PoiRootListModel<PoiPhotoResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiPhotoResponseModel>.self,
      url: NetworkManager.makeUrl(
        baseURL: AppConfig.baseURL,
        path: Endpoints.businessPhotos.path,
        queryItems: params
      )!,
      headers: AppConfig.headers
    )
  }
}


// MARK: - ⌘ POI Review
public protocol PoiReviewRemoteDataSource {
  func fetchPoiReviews(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiReviewResponseModel>, NError>
}


extension RemoteDataSourceImpl: PoiReviewRemoteDataSource {

  public func fetchPoiReviews(params: [String : String]) -> AnyPublisher<PoiRootListModel<PoiReviewResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiReviewResponseModel>.self,
      url: NetworkManager.makeUrl(
        baseURL: AppConfig.baseURL,
        path: Endpoints.businessReviews.path,
        queryItems: params
      )!,
      headers: AppConfig.headers
    )
  }
}


// MARK: - ⌘ POI Autocomplete
public protocol PoiAutoCompleteRemoteDataSource {
  func fetchPoiAutoComplete(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiAutocompleteItemResponseModel>, NError>
}


extension RemoteDataSourceImpl: PoiAutoCompleteRemoteDataSource {

  public func fetchPoiAutoComplete(params: [String: String]) -> AnyPublisher<PoiRootListModel<PoiAutocompleteItemResponseModel>, NError> {
    return networkService.getRequest(
      of: PoiRootListModel<PoiAutocompleteItemResponseModel>.self,
      url: NetworkManager.makeUrl(
        baseURL: AppConfig.baseURL,
        path: Endpoints.autocomplete.path,
        queryItems: params
      )!,
      headers: AppConfig.headers
    )
  }
}

