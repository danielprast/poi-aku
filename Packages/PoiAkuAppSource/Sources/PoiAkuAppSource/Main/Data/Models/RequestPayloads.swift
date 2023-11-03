//
//  RequestPayloads.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


extension PoiModule.Data.Payload {

  public struct SearchPoi {
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

    public var requestParams: [String: Any] {
      var params: [String: Any] = [:]
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