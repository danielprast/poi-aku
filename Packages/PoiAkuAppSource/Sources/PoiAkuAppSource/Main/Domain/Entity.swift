//
//  Entity.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


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
