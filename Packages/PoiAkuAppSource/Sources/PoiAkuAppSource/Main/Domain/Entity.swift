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
