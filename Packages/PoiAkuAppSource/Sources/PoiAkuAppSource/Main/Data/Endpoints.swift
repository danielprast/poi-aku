//
//  Endpoints.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public enum Endpoints {
  case searchInArea
  case searchNearby
  case businessDetails
  case businessReviews
  case businessPhotos
  case autocomplete

  var path: String {
    switch self {
    case .searchInArea:
      return "search-in-area"
    case .searchNearby:
      return "search-nearby"
    case .businessDetails:
      return "business-details"
    case .businessReviews:
      return "business-reviews"
    case .businessPhotos:
      return "business-photos"
    case .autocomplete:
      return "autocomplete"
    }
  }
}
