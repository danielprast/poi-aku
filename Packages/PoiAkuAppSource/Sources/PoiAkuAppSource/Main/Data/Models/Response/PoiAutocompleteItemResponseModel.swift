//
//  PoiAutocompleteItemResponseModel.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import Foundation


public typealias PoiAutocompleteItemResponseModel = PoiModule.Data.Response.AutoCompleteItem


extension PoiModule.Data.Response {

  // MARK: - PostsResponse
  public struct AutoCompleteItem: Codable {
    public let type: String
    public let googleID: String
    public let description, mainText: String
    public let mainTextHighlights: [TextHighlight]
    public let secondaryText: String
    public let secondaryTextHighlights: [TextHighlight]
    public let latitude, longitude: Double
    public let country: String

    public enum CodingKeys: String, CodingKey {
      case type
      case googleID = "google_id"
      case description
      case mainText = "main_text"
      case mainTextHighlights = "main_text_highlights"
      case secondaryText = "secondary_text"
      case secondaryTextHighlights = "secondary_text_highlights"
      case latitude, longitude, country
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.AutoCompleteItem.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.self)
      self.type = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.type) ?? ""
      self.googleID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.googleID) ?? ""
      self.description = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.description) ?? ""
      self.mainText = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.mainText) ?? ""
      self.mainTextHighlights = try container.decode([PoiModule.Data.Response.TextHighlight].self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.mainTextHighlights)
      self.secondaryText = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.secondaryText) ?? ""
      self.secondaryTextHighlights = try container.decodeIfPresent([PoiModule.Data.Response.TextHighlight].self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.secondaryTextHighlights) ?? .init()
      self.latitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.latitude) ?? 0.0
      self.longitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.longitude) ?? 0.0
      self.country = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.AutoCompleteItem.CodingKeys.country) ?? ""
    }

    public init(
      type: String = "",
      googleID: String = "",
      description: String = "",
      mainText: String = "",
      mainTextHighlights: [TextHighlight] = [],
      secondaryText: String = "",
      secondaryTextHighlights: [TextHighlight] = [],
      latitude: Double = 0.0,
      longitude: Double = 0.0,
      country: String = ""
    ) {
      self.type = type
      self.googleID = googleID
      self.description = description
      self.mainText = mainText
      self.mainTextHighlights = mainTextHighlights
      self.secondaryText = secondaryText
      self.secondaryTextHighlights = secondaryTextHighlights
      self.latitude = latitude
      self.longitude = longitude
      self.country = country
    }
  }

  public struct TextHighlight: Codable {

    public let offset, length: Int

    public enum CodingKeys: CodingKey {
      case offset
      case length
    }

    public init(offset: Int = 0, length: Int = 0) {
      self.offset = offset
      self.length = length
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.TextHighlight.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.TextHighlight.CodingKeys.self)
      self.offset = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.TextHighlight.CodingKeys.offset) ?? 0
      self.length = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.TextHighlight.CodingKeys.length) ?? 0
    }
  }

}
