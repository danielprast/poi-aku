//
//  RequestPayloads.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public protocol RequestPayload {
  var requestParams: [String: String] { get }
}


// MARK: - ⌘ Poi Search
extension PoiModule.Data.Payload {

  public struct SearchPoi: RequestPayload {
    public let keyword: String
    public let lat: Double
    public let lng: Double
    public let zoom: Int?

    public init(
      keyword: String = "",
      lat: Double = 0.0,
      lng: Double = 0.0,
      zoom: Int? = nil
    ) {
      self.keyword = keyword
      self.lat = lat
      self.lng = lng
      self.zoom = zoom
    }

    public var requestParams: [String: String] {
      var params: [String: String] = [:]
      params["query"] = keyword
      params["lat"] = "\(lat)"
      params["lng"] = "\(lng)"
      if let zoom = zoom {
        params["zoom"] = "\(zoom)"
      }
      return params
    }
  }

}


// MARK: - ⌘ Poi Autocomplete
public typealias PoiAutoCompletePayload = PoiModule.Data.Payload.AutoComplete
extension PoiModule.Data.Payload {

  public struct AutoComplete: RequestPayload {
    public let keyword: String
    public let lat: Double?
    public let lng: Double?

    public init(keyword: String, lat: Double? = nil, lng: Double? = nil) {
      self.keyword = keyword
      self.lat = lat
      self.lng = lng
    }

    public var requestParams: [String : String] {
      var params: [String: String] = [:]
      params["query"] = keyword
      if let lat = lat, let lng = lng {
        params["coordinates"] = "\(lat),\(lng)"
      }
      return params
    }
  }

}


// MARK: - ⌘ Poi Detail
extension PoiModule.Data.Payload {

  public struct PoiDetail: RequestPayload {
    let businessId: String

    public init(businessId: String) {
      self.businessId = businessId
    }

    public var requestParams: [String : String] {
      [ "business_id" : businessId ]
    }
  }

}


// MARK: - ⌘ Poi Photo
extension PoiModule.Data.Payload {

  public struct PoiPhoto: RequestPayload {
    let businessId: String

    public init(businessId: String) {
      self.businessId = businessId
    }

    public var requestParams: [String : String] {
      [ "business_id" : businessId ]
    }
  }

}


// MARK: - ⌘ Poi Review
extension PoiModule.Data.Payload {

  public struct PoiReview: RequestPayload {
    let businessId: String

    public init(businessId: String) {
      self.businessId = businessId
    }

    public var requestParams: [String : String] {
      [ "business_id" : businessId ]
    }
  }

}
