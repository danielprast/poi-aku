//
//  PoiDetailResponseModelTest.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import XCTest
@testable import PoiAkuAppSource


final class PoiDetailResponseModelTest: XCTestCase {

  func test_parseResponseJson() throws {
    let jsonData = JsonResolver.loadJsonFromFile(with: "poi_detail")
    let result = JsonResolver.decodeJson(
      from: jsonData,
      outputType: PoiRootListModel<PoiDetailResponseModel>.self
    )
    XCTAssertNotNil(result)
  }

}
