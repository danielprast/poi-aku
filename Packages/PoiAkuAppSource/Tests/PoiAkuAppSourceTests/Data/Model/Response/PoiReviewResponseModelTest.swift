//
//  PoiReviewResponseModelTest.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import XCTest
@testable import PoiAkuAppSource


final class PoiReviewResponseModelTest: XCTestCase {

  func test_parseResponseJson() throws {
    let jsonData = JsonResolver.loadJsonFromFile(with: "poi_review")
    let result = JsonResolver.decodeJson(
      from: jsonData,
      outputType: PoiRootListModel<PoiReviewResponseModel>.self
    )
    XCTAssertNotNil(result)
  }

}
