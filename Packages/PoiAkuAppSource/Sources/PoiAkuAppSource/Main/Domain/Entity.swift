//
//  Entity.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


// MARK: - ⌘ Poi Photos Entity

public typealias PoiPhotosEntity = PoiModule.Data.Model.PoiPhotos


extension PoiModule.Data.Model {

  public struct PoiPhotos {
    let photos: [PoiPhoto]

    public init(photos: [PoiPhoto]) {
      self.photos = photos
    }
  }

  public struct PoiPhoto {
    let id: String

    public init(response: PoiPhotoResponseModel) {
      self.response = response
      self.id = response.photoID
    }

    var response: PoiPhotoResponseModel = .init()
  }
}


// MARK: - ⌘ Poi Reviews Entity

public typealias PoiReviewsEntity = PoiModule.Data.Model.PoiReviews


extension PoiModule.Data.Model {

  public struct PoiReviews {
    let reviews: [PoiReview]

    public init(reviews: [PoiReview]) {
      self.reviews = reviews
    }
  }

  public struct PoiReview {
    let id: String

    public init(response: PoiReviewResponseModel) {
      self.response = response
      self.id = response.reviewID
    }

    var response: PoiReviewResponseModel = .init()
  }
}


// MARK: - ⌘ Poi Detail Entity

public typealias PoiDetailEntity = PoiModule.Data.Model.PoiDetail


extension PoiModule.Data.Model {

  public struct PoiDetail {
    let id: String

    public init(id: String) {
      self.id = id
    }

    public init(response: PoiDetailResponseModel) {
      self.id = response.businessID
      self.response = response
    }

    var response: PoiDetailResponseModel = .init()
  }

}


// MARK: - ⌘ Poi List Entity

public typealias PoiListEntity = PoiModule.Data.Model.PoiList


extension PoiModule.Data.Model {

  public struct PoiList {
    let poiList: [PoiDetailEntity]

    public init(poiList: [PoiDetailEntity]) {
      self.poiList = poiList
    }

    public init(response: PoiRootListModel<PoiSearchNearbyResponseModel>) {
      self.nearbyResponse = response.data
      self.poiList = []
    }

    public init(response: PoiRootListModel<PoiSearchInAreaResponseModel>) {
      self.areaResponse = response.data
      self.poiList = []
    }

    var areaResponse: [PoiSearchInAreaResponseModel] = []
    var nearbyResponse: [PoiSearchNearbyResponseModel] = []
  }

}
