//
//  AppConfig.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public struct AppConfig {

  public init() {}

  static let baseURL = "https://\(API_HOST)/"

  static let headers: RequestHeaders = [
    "Cache-Control" : "no-cache",
    "X-RapidAPI-Key" : AppConfig.getApiKey(),
    "X-RapidAPI-Host" : AppConfig.API_HOST
  ]

  static let API_HOST = "local-business-data.p.rapidapi.com"

  static func getApiKey() -> String {
    let data = JsonResolver.loadJsonFromFile(with: "apiKeys")
    guard let credential = JsonResolver.decodeJson(from: data, outputType: AppCredential.self) else {
      return "halo dulur!"
    }
    return credential.apikey
  }

}


public struct AppCredential: Codable {
  public let apikey: String

  public init(apikey: String) {
    self.apikey = apikey
  }
}
