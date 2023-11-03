//
//  SearchInAreaPoiResponseModelTest.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import XCTest
@testable import PoiAkuAppSource


final class SearchInAreaPoiResponseModelTest: XCTestCase {

  func testPerformanceExample() throws {
    let jsonData = JsonResolver.loadJsonFromFile(with: "poi_search_in_area")
    let result = JsonResolver.decodeJson(
      from: jsonData,
      outputType: PoiModule.Data.Response.JArray<PoiModule.Data.Response.PoiSearchInArea>.self
    )
    XCTAssertNotNil(result)
  }

}
