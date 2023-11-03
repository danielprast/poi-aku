//
//  PoiSearchNearbyResponseModel.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public typealias PoiSearchNearbyResponseModel = PoiModule.Data.Response.PoiSearchNearby


// MARK: ⌘ POI Search Nearby
extension PoiModule.Data.Response {

  public struct PoiSearchNearby: Codable {
    public let businessID, googleID, placeID: String
    public let cid: String
    public let ownerID: String
    public let phoneNumber: String
    public let name: String
    public let latitude, longitude: Double
    public let fullAddress: String
    public let reviewCount: Int
    public let rating: Double
    public let timezone: String
    public let website: String
    public let verified: Bool
    public let businessStatus: String
    public let type: String
    public let photoCount: Int
    public let address: String
    public let streetAddress: String
    public let city: String
    public let zipcode: String
    public let state: String
    public let country: String

    public enum CodingKeys: String, CodingKey {
      case businessID = "business_id"
      case googleID = "google_id"
      case placeID = "place_id"
      case phoneNumber = "phone_number"
      case name, latitude, longitude
      case cid
      case ownerID = "owner_id"
      case fullAddress = "full_address"
      case reviewCount = "review_count"
      case rating
      case timezone
      case website
      case verified
      case businessStatus = "business_status"
      case type
      case photoCount = "photo_count"
      case address
      case streetAddress = "street_address"
      case city
      case zipcode
      case state
      case country
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.PoiSearchInArea.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.self)
      self.businessID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.businessID) ?? ""
      self.googleID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.googleID) ?? ""
      self.placeID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.placeID) ?? ""
      self.phoneNumber = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.phoneNumber) ?? ""
      self.name = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.name) ?? ""
      self.latitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.latitude) ?? 0.0
      self.longitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.longitude) ?? 0.0
      self.cid = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.cid) ?? ""
      self.ownerID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.ownerID) ?? ""
      self.fullAddress = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.fullAddress) ?? ""
      self.reviewCount = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.reviewCount) ?? -1
      self.rating = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.rating) ?? 0.0
      self.timezone = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.timezone) ?? ""
      self.website = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.website) ?? ""
      self.verified = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.verified) ?? false
      self.businessStatus = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.businessStatus) ?? ""
      self.type = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.type) ?? ""
      self.photoCount = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.photoCount) ?? -1
      self.address = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.address) ?? ""
      self.streetAddress = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.streetAddress) ?? ""
      self.city = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.city) ?? ""
      self.zipcode = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.zipcode) ?? ""
      self.state = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.state) ?? ""
      self.country = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiSearchInArea.CodingKeys.country) ?? ""
    }

    public static func createEmpty() -> PoiSearchInArea {
      .init(
        businessID: "String",
        googleID: "String",
        placeID: "String",
        cid: "String",
        ownerID: "String",
        phoneNumber: "String",
        name: "String",
        latitude: 0.0,
        longitude: 0.0,
        fullAddress: "String",
        reviewCount: -1,
        rating: 0.0,
        timezone: "String",
        website: "String",
        verified: false,
        businessStatus: "String",
        type: "String",
        photoCount: -1,
        address: "String",
        streetAddress: "String",
        city: "String",
        zipcode: "String",
        state: "String",
        country: "String"
      )
    }

    public init(
      businessID: String,
      googleID: String,
      placeID: String,
      cid: String,
      ownerID: String,
      phoneNumber: String,
      name: String,
      latitude: Double,
      longitude: Double,
      fullAddress: String,
      reviewCount: Int,
      rating: Double,
      timezone: String,
      website: String,
      verified: Bool,
      businessStatus: String,
      type: String,
      photoCount: Int,
      address: String,
      streetAddress: String,
      city: String,
      zipcode: String,
      state: String,
      country: String
    ) {
      self.businessID = businessID
      self.googleID = googleID
      self.placeID = placeID
      self.cid = cid
      self.ownerID = ownerID
      self.phoneNumber = phoneNumber
      self.name = name
      self.latitude = latitude
      self.longitude = longitude
      self.fullAddress = fullAddress
      self.reviewCount = reviewCount
      self.rating = rating
      self.timezone = timezone
      self.website = website
      self.verified = verified
      self.businessStatus = businessStatus
      self.type = type
      self.photoCount = photoCount
      self.address = address
      self.streetAddress = streetAddress
      self.city = city
      self.zipcode = zipcode
      self.state = state
      self.country = country
    }
  }

}
