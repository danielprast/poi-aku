//
//  SearchPoiNearbyResponseModelTest.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import XCTest
@testable import PoiAkuAppSource


final class SearchPoiNearbyResponseModelTest: XCTestCase {

  func test_parseResponseJson() throws {
    let jsonData = JsonResolver.loadJsonFromFile(with: "poi_search_nearby")
    let result = JsonResolver.decodeJson(
      from: jsonData,
      outputType: PoiRootListModel<PoiDetailResponseModel>.self
    )
    XCTAssertNotNil(result)
  }

}
