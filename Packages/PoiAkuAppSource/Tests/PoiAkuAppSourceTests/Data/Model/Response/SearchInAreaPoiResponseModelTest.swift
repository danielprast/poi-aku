//
//  SearchInAreaPoiResponseModelTest.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import XCTest
@testable import PoiAkuAppSource


final class SearchInAreaPoiResponseModelTest: XCTestCase {

  func test_parseResponseJson() throws {
    let jsonData = JsonResolver.loadJsonFromFile(with: "poi_search_in_area")
    let result = JsonResolver.decodeJson(
      from: jsonData,
      outputType: PoiModule.Data.Response.JArray<PoiDetailResponseModel>.self
    )
    XCTAssertNotNil(result)
  }

}
