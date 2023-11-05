//
//  PoiPhotoResponseModel.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public typealias PoiPhotoResponseModel = PoiModule.Data.Response.PhotosSample


extension PoiModule.Data.Response {

  public struct PhotosSample: Codable {
    public let photoID: String
    public let photoURL: String
    public let photoURLLarge: String
    public let videoThumbnailURL: String
    public let latitude, longitude: Double
    public let type: String
    public let photoDatetimeUTC: String
    public let photoTimestamp: Int

    public enum CodingKeys: String, CodingKey {
      case photoID = "photo_id"
      case photoURL = "photo_url"
      case photoURLLarge = "photo_url_large"
      case videoThumbnailURL = "video_thumbnail_url"
      case latitude, longitude, type
      case photoDatetimeUTC = "photo_datetime_utc"
      case photoTimestamp = "photo_timestamp"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.PhotosSample.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.PhotosSample.CodingKeys.self)
      self.photoID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.photoID) ?? ""
      self.photoURL = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.photoURL) ?? ""
      self.photoURLLarge = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.photoURLLarge) ?? ""
      self.videoThumbnailURL = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.videoThumbnailURL) ?? ""
      self.latitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.latitude) ?? 0.0
      self.longitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.longitude) ?? 0.0
      self.type = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.type) ?? ""
      self.photoDatetimeUTC = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.photoDatetimeUTC) ?? ""
      self.photoTimestamp = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.PhotosSample.CodingKeys.photoTimestamp) ?? -1
    }

    public init(
      photoID: String = "",
      photoURL: String = "",
      photoURLLarge: String = "",
      videoThumbnailURL: String = "",
      latitude: Double = 0.0,
      longitude: Double = 0.0,
      type: String = "",
      photoDatetimeUTC: String = "",
      photoTimestamp: Int = 0
    ) {
      self.photoID = photoID
      self.photoURL = photoURL
      self.photoURLLarge = photoURLLarge
      self.videoThumbnailURL = videoThumbnailURL
      self.latitude = latitude
      self.longitude = longitude
      self.type = type
      self.photoDatetimeUTC = photoDatetimeUTC
      self.photoTimestamp = photoTimestamp
    }
  }

}
