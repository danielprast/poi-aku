//
//  AppConfigTest.swift
//  
//
//  Created by Daniel Prastiwa on 03/11/23.
//

import XCTest
@testable import PoiAkuAppSource


final class AppConfigTest: XCTestCase {

  func test_parseCredentialShouldFail() {
    // isi sendiri api key-nya ya 😁
    XCTAssertEqual(AppConfig.getApiKey(), "halo dulur!")
  }

}
