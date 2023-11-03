//
//  Models.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


// MARK: ⌘ Search POI
extension PoiModule.Data.Response {

    

}


// MARK: ⌘ POI Details
extension PoiModule.Data.Response {



}


// MARK: ⌘ POI Photos
extension PoiModule.Data.Response {



}


// MARK: ⌘ POI Reviews
extension PoiModule.Data.Response {



}


// MARK: ⌘ Root Response Model
extension PoiModule.Data.Response {

  public struct JObject<T: Codable>: Codable {
    public let requestId: String
    public let status: String
    public let data: T

    public enum CodingKeys: String, CodingKey {
      case requestId = "request_id"
      case status
      case data
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.JObject<T>.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.JObject<T>.CodingKeys.self)
      self.requestId = try container.decode(String.self, forKey: PoiModule.Data.Response.JObject<T>.CodingKeys.requestId)
      self.status = try container.decode(String.self, forKey: PoiModule.Data.Response.JObject<T>.CodingKeys.status)
      self.data = try container.decode(T.self, forKey: PoiModule.Data.Response.JObject<T>.CodingKeys.data)
    }

    public init(requestId: String, status: String, data: T) {
      self.requestId = requestId
      self.status = status
      self.data = data
    }
  }

  public struct JArray<T: Codable>: Codable {
    public let requestId: String
    public let status: String
    public let data: [T]

    public enum CodingKeys: String, CodingKey {
      case requestId = "request_id"
      case status
      case data
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.JArray<T>.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.JArray<T>.CodingKeys.self)
      self.requestId = try container.decode(String.self, forKey: PoiModule.Data.Response.JArray<T>.CodingKeys.requestId)
      self.status = try container.decode(String.self, forKey: PoiModule.Data.Response.JArray<T>.CodingKeys.status)
      self.data = try container.decode([T].self, forKey: PoiModule.Data.Response.JArray<T>.CodingKeys.data)
    }

    public init(requestId: String, status: String, data: [T]) {
      self.requestId = requestId
      self.status = status
      self.data = data
    }
  }

}
