//
//  NetworkManager.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation
import SystemConfiguration
import Combine
import Alamofire


public let defaultMessage = "Ups... something went wrong! Please try again"

public struct NetworkManager {

  let urlSession: URLSession

  public init(urlSession: URLSession = .shared) {
    self.urlSession = urlSession
  }

  // MARK: - URLSession Requests
  func postMultipartRequest<T>(
    of: T.Type,
    url: URL,
    params: RequestParameters = [:],
    media: [Attachment] = [],
    headers: RequestHeaders
  ) -> AnyPublisher<T, NError> where T: Decodable {

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    for (key, value) in headers {
      if !key.isEmpty {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }

    let boundary = generateBoundaryString()

    request.setValue(
      "multipart/form-data; boundary=\(boundary)",
      forHTTPHeaderField: "Content-Type"
    )

    request.httpBody = createDataBody(
      withParameters: params,
      media: media,
      boundary: boundary
    )

    shout("post_url", url)
    shout("post_parameters", request.httpBody as Any)
    shout("post_headers", request.allHTTPHeaderFields as Any)

    #if DEBUG
    dump(request)
    #endif

    return urlSession.dataTaskPublisher(for: request)
      .tryMap { (data, response) in
        guard let httpResponse = response as? HTTPURLResponse
        else {
          throw NError.custom(defaultMessage)
        }
        shout("status_code", httpResponse.statusCode)
        inspectResponseData(data, withTag: "Post Multipart Request response")
        return try validateResponse(data: data, httpResponse: httpResponse)
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .mapError { error in
        return self.mapError(error: error)
      }
      .eraseToAnyPublisher()
  }

  func postRequest<T>(
    of: T.Type,
    url: URL,
    headers: RequestHeaders,
    withData paramData: Data?
  ) -> AnyPublisher<T, NError> where T: Decodable {
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = paramData

    for (key, value) in headers {
      if !key.isEmpty {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }

    shout("post request", "Joss")
    shout("Post params data", paramData as Any)
    #if DEBUG
    dump(request)
    #endif

    return urlSession.dataTaskPublisher(for: request)
      .tryMap { (data, response) in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw NError.custom(defaultMessage)
        }
        shout("status code post request", httpResponse.statusCode)
        self.inspectResponseData(data, withTag: "postRequest response")
        return try self.validateResponse(data: data, httpResponse: httpResponse)
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .mapError { error in
        return self.mapError(error: error)
      }
      .eraseToAnyPublisher()
  }

  func postRequest<T>(
    of: T.Type,
    url: URL,
    headers: RequestHeaders,
    params: RequestParameters = [:]
  ) -> AnyPublisher<T, NError> where T: Decodable {
    let jsonString = JsonResolver.encodeToJson(dictionary: params)
    let paramData = JsonResolver.createData(fromString: jsonString)

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = paramData

    for (key, value) in headers {
      if !key.isEmpty {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }

    shout("post request", "Joss")
    shout("Post params", jsonString)
    shout("Post params data", paramData as Any)
    #if DEBUG
    dump(request)
    #endif

    return urlSession.dataTaskPublisher(for: request)
      .tryMap { (data, response) in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw NError.custom(defaultMessage)
        }
        shout("status code post request", httpResponse.statusCode)
        self.inspectResponseData(data, withTag: "postRequest response")
        return try self.validateResponse(data: data, httpResponse: httpResponse)
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .mapError { error in
        return self.mapError(error: error)
      }
      .eraseToAnyPublisher()
  }

  func getRequest<T>(
    of: T.Type,
    url: URL,
    headers: RequestHeaders
  ) -> AnyPublisher<T, NError> where T: Decodable {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    for (key, value) in headers {
      if !key.isEmpty {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }

    shout("get_url", url.absoluteString)
    shout("get_headers", "\(headers)")

    #if DEBUG
    dump(request)
    #endif

    return urlSession.dataTaskPublisher(for: request)
      .tryMap { (data, response) in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw NError.custom(defaultMessage)
        }
        self.inspectResponseData(data, withTag: "getRequest response")
        return try self.validateResponse(data: data, httpResponse: httpResponse)
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .mapError { error in
        return self.mapError(error: error)
      }
      .eraseToAnyPublisher()
  }

  // MARK: ⌘ Async await network

  func postAsyncRequest<T>(
    of: T.Type,
    url: URL,
    headers: RequestHeaders,
    params: RequestParameters = [:],
    isJsonPost: Bool = true
  ) async throws -> T where T: Decodable {
    let jsonParams = JsonResolver.createData(from: params)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = jsonParams

    for (key, value) in headers {
      if !key.isEmpty {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }

    if isJsonPost {
      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }

    do {
      let (data, response) = try await urlSession.data(for: request, delegate: nil)
      guard let httpResponse = response as? HTTPURLResponse else {
        throw NError.custom("Invalid response from server")
      }

      #if DEBUG
      dump(request)
      shout("request params", JsonResolver.encodeToJson(dictionary: params))
      shout("http response", response)
      #endif

      do {
        let responseData = try validateResponse(data: data, httpResponse: httpResponse)
        inspectResponseData(responseData, withTag: "post async response")
        return try JSONDecoder().decode(T.self, from: responseData)
      } catch {
        throw mapError(error: error)
      }
    } catch {
      throw mapError(error: error)
    }
  }

  func getAsyncRequest<T>(
    of: T.Type,
    url: URL,
    headers: RequestHeaders
  ) async throws -> T where T: Decodable {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    for (key, value) in headers {
      if !key.isEmpty {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }

    shout("get_url", url.absoluteString)
    shout("get_headers", "\(headers)")

    #if DEBUG
    dump(request)
    #endif

    do {
      let (data, response) = try await urlSession.data(for: request, delegate: nil)
      guard let httpResponse = response as? HTTPURLResponse else {
        throw NError.custom("Invalid response from server")
      }

      do {
        let responseData = try validateResponse(data: data, httpResponse: httpResponse)
        inspectResponseData(responseData, withTag: "get async response")
        return try JSONDecoder().decode(T.self, from: responseData)
      } catch {
        throw mapError(error: error)
      }
    } catch {
      throw mapError(error: error)
    }
  }

  func getAsyncRequestArrayResult<T>(
    of: [T].Type,
    url: URL,
    headers: RequestHeaders
  ) async throws -> [T] where T: Decodable {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    for (key, value) in headers {
      if !key.isEmpty {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }

    shout("get_url", url.absoluteString)
    shout("get_headers", "\(headers)")

    #if DEBUG
    dump(request)
    #endif

    do {
      let (data, response) = try await urlSession.data(for: request, delegate: nil)
      guard let httpResponse = response as? HTTPURLResponse else {
        throw NError.custom("Invalid response from server")
      }

      do {
        let responseData = try validateResponse(data: data, httpResponse: httpResponse)
        inspectResponseData(responseData, withTag: "get async array response")
        return try JSONDecoder().decode([T].self, from: responseData)
      } catch {
        throw mapError(error: error)
      }
    } catch {
      throw mapError(error: error)
    }
  }

  // MARK: - Alamofire
  func postRequestAlamofire<T>(
    of: T.Type,
    url: URL,
    headers: RequestHeaders,
    params: RequestParameters = [:]
  ) -> AnyPublisher<T, NError> where T: Decodable {
    return Future<T, NError> { promise in
      let requestHeaders = HTTPHeaders(headers)
      shout("URL", url)
      shout("Post request headers", headers)
      shout("Post request params", JsonResolver.encodeToJson(dictionary: params))
      AF.request(
        url,
        method: .post,
        parameters: params,
        encoding: JSONEncoding.default,
        headers: requestHeaders
      )
      .validate()
      .responseData { response in
        guard
          let data = response.data,
          let httpResponse = response.response
        else {
          promise(.failure(.custom(defaultMessage)))
          return
        }

        inspectResponseData(data, withTag: "Post alamofire response")

        do {
          let data = try validateResponse(data: data, httpResponse: httpResponse)
          guard let dataModel: T = try? JSONDecoder().decode(T.self, from: data)
          else {
            promise(.failure(.parsingError))
            return
          }
          promise(.success(dataModel))
        } catch {
          let exception = error as! NError
          promise(.failure(exception))
        }
      }
    }.eraseToAnyPublisher()
  }

  fileprivate func inspectResponse(_ response: AFDataResponse<Data>) {
    shout("Network Request Response", "----------------------------------------")
    shout("headers", response.request?.allHTTPHeaderFields as Any)
    shout("url request", String(describing: response.request?.url))
    shout("Response Status Code", response.response?.statusCode ?? -1)
    #if DEBUG
    dump(response.request)
    #endif
    guard let data = response.data else {
      shout("response body", String(describing: response.data?.prettyPrintedJSONString ?? ""))
      return
    }
    shout("Response data", String(describing: data.prettyPrintedJSONString ?? ""))
    shout("End network Request Response", "----------------------------------------\n")
  }

  // MARK: - Raw Service
  /*func requestRawJSON(
    with url: String,
    withMethod method: Method?,
    withHeaders headers: [String : String],
    withParameter parameters: [String : Any],
    withEncoding encoding: Encoding?,
    completion: @escaping(Result<String, NError>) -> Void
  ) {

    var RequestHeaders: HTTPHeaders = [:]
    for (k, v) in headers {
      RequestHeaders.add(name: k, value: v)
    }

    AF.request(
      url,
      method: method!.getMethod(),
      parameters: parameters,
      encoding: encoding!.getEncoding(),
      headers: RequestHeaders
    )
    .validate()
    .responseString(
      queue: DispatchQueue.main,
      encoding: .utf8
    ) { response in

      //Log
      shout("url", String(describing: response.request))
      shout("header", String(describing: headers))
      if let httpBody = response.request?.httpBody {
        shout("parameter", NSString(data: httpBody, encoding: String.Encoding.utf8.rawValue) ?? "no params")
      }
      shout("statusCode", String(describing: response.response?.statusCode ?? -1))

      switch response.result {
      case .failure(let error):
        completion(.failure(NError.custom(error.errorDescription ?? "")))
      case .success(let jsonStr):
        completion(.success(jsonStr))
      }
    }
  }

  public func request<T: Codable>(
    of type: T.Type,
    with url: String,
    withMethod method: Method? = .get,
    withHeaders headers: [String: String] = [:],
    withParameter parameters: [String: Any] = [:],
    withEncoding encoding: Encoding? = .url,
    completion: @escaping(Result<T, NError>
    ) -> Void) {


    var httpHeaders: HTTPHeaders = [:]
    for (k, v) in headers {
      httpHeaders.add(name: k, value: v)
    }

    AF.request(
      url,
      method: method?.getMethod() ?? .get,
      parameters: parameters,
      encoding: encoding?.getEncoding() ?? URLEncoding.default,
      headers: httpHeaders
    )
    .responseString(
      queue: DispatchQueue.main,
      encoding: String.Encoding.utf8,
      completionHandler: { (response) in

        //Log
        shout("url", String(describing: response.request))
        shout("header", String(describing: headers))
        if let httpBody = response.request?.httpBody {
          shout("parameter", NSString(data: httpBody, encoding: String.Encoding.utf8.rawValue) ?? "no params")
        }
        shout("statusCode", String(describing: response.response?.statusCode ?? -1))

        let jsonStr = String(data: response.data ?? Data(), encoding: .utf8)!
        let pretty = jsonStr.replacingOccurrences(of: "\\", with: "")
        shout("response", pretty)

        if let error = response.error {
          if error.responseCode == -1009 {
            completion(.failure(NError.custom("Connection Problem")))
          }else if error.responseCode == -1001 {
            completion(.failure(NError.custom("Connection Timeout")))
          }else {
            completion(.failure(NError.custom("Failure")))
          }
          return
        }

        guard let code = response.response?.statusCode else {
          completion(.failure(NError.custom("Can't Define Error")))
          return
        }

        if 200 ... 299 ~= code  {
          //success
          guard let data = response.data else {
            completion(.failure(NError.custom("Data Not Found")))
            return
          }

          //parsing json
          do {
            let json = try JSONDecoder().decode(T.self, from: data)
            completion(.success(json))

          } catch {
            completion(.failure(NError.custom("Parse Error")))
          }


        } else if code == 401 {
          completion(.failure(NError.custom("Unauthorized")))

        } else if code == 404 {
          completion(.failure(NError.custom("Source Not Found")))

        } else if code == 500 {
          //internal server error
          completion(.failure(NError.custom("Internal Server Error")))

        } else {
          // throw unknown error
          completion(.failure(NError.custom("Unkonwn Error")))
        }
      })


  }


  public func combineRequest<T: Codable>(
    of type: T.Type,
    with url: String,
    withMethod method: Method? = .get,
    withHeaders headers: [String: String] = [:],
    withParameter parameters: [String: Any] = [:],
    withEncoding encoding: Encoding? = .url
  ) -> AnyPublisher<T, NError> {

    var httpHeaders: HTTPHeaders = [:]
    for (k, v) in headers {
      httpHeaders.add(name: k, value: v)
    }

    return self.createPublisher(
      with: url,
      withMethod: method?.getMethod(),
      withHeaders: httpHeaders,
      withParameter: parameters,
      withEncoding: encoding?.getEncoding()
    )
    .decode(type: T.self, decoder: JSONDecoder())
    .mapError { $0 as! NError }
    .eraseToAnyPublisher()

  }

  fileprivate func createPublisher(
    with url: String,
    withMethod method: HTTPMethod? = .get,
    withHeaders headers: HTTPHeaders = [:],
    withParameter parameters: Parameters = [:],
    withEncoding encoding: ParameterEncoding? = URLEncoding.default
  ) -> AnyPublisher<Data, NError> {

    return Future<Data, NError> { completion in

      AF.request(
        url,
        method: method ?? .get,
        parameters: parameters,
        encoding: encoding ?? URLEncoding.default,
        headers: headers
      ) { $0.timeoutInterval = 30 }
        .responseString(
          queue: DispatchQueue.main,
          encoding: String.Encoding.utf8,
          completionHandler: { (response) in

            //Log
            shout("url", String(describing: response.request))
            shout("header", String(describing: headers))
            if let httpBody = response.request?.httpBody {
              shout("parameter", NSString(data: httpBody, encoding: String.Encoding.utf8.rawValue) ?? "no params")
            }
            shout("status_code", String(describing: response.response?.statusCode ?? -1))

            let jsonStr = String(data: response.data ?? Data(), encoding: .utf8)!
            let pretty = jsonStr.replacingOccurrences(of: "\\", with: "")
            shout("response", pretty)

            if let error = response.error {
              if error.responseCode == -1009 {
                completion(.failure(NError.custom("Connection Problem")))
              }else if error.responseCode == -1001 {
                completion(.failure(NError.custom("Connection Timeout")))
              }else {
                completion(.failure(NError.custom(error.errorDescription!)))
              }
              return
            }

            guard let code = response.response?.statusCode else {
              completion(.failure(NError.custom("Can't Define Error")))
              return
            }

            if 200 ... 299 ~= code  {
              //success
              guard let data = response.data else {
                completion(.failure(NError.custom("Data Not Found")))
                return
              }

              completion(.success(data))


            } else if 401 ... 403 ~= code {
              completion(.failure(NError.custom( "Unauthorized")))

            } else if code == 404 {
              guard let data = response.data else { return }

              do {
                let message = try self.parseError(data: data)
                completion(.failure(NError.custom( message)))
              }catch {
                completion(.failure(NError.custom("Parse Error")))
              }

            } else if code == 500 {
              //internal server error
              completion(.failure(NError.custom( "Internal Server Error")))

            } else {
              // throw unknown error
              completion(.failure(NError.custom("Unkonwn Error")))
            }
          })

    }.eraseToAnyPublisher()

  }
   */


  // MARK: -

  func inspectResponseData(_ response: Data, withTag tag: String = "Response") {
    let jObject = JsonResolver.parseDataToJson(response)
    shout(tag, "\n" + JsonResolver.encodeToJson(dictionary: jObject))
  }

  fileprivate func mapError(error: Error) -> NError {
    if error is NError {
      return error as! NError
    }

    if error is DecodingError {
      return NError.parsingError
    }

    return NError.custom(error.localizedDescription)
  }

  fileprivate func parseError(data: Data) throws -> String{
    do {
      if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
        if let message = json["message"] as? String {
          return message
        }
      }
    } catch {
      throw NError.custom("Parse error")
    }
    return ""
  }

  fileprivate func parsingErrorResponse(data: Data) -> String? {
    let jsonObject = JsonResolver.parseDataToJson(data)
    if jsonObject.isEmpty {
      return nil
    }

    guard let messagesData = jsonObject["message"] as? String else {
      return nil
    }

    return messagesData
  }

  fileprivate func createDataBody(
    withParameters params: RequestParameters?,
    media: [Attachment],
    boundary: String
  ) -> Data {
    let lineBreak = "\r\n"
    var body = Data()

    if let parameters = params {
      for (key, value) in parameters {
        body.append("--\(boundary + lineBreak)")
        body.append(
          "Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)"
        )
        body.append("\(value)\(lineBreak)")
      }
    }

    if !media.isEmpty {
      for photo in media {
        body.append("--\(boundary + lineBreak)")
        body.append(
          "Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)"
        )
        body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
        body.append(photo.data)
        body.append(lineBreak)
      }
    }

    body.append("--\(boundary)--\(lineBreak)")
    return body
  }

  fileprivate func validateResponse(data: Data, httpResponse: HTTPURLResponse) throws -> Data {
    switch httpResponse.statusCode {
    case 200, 201:
      return data
    case 204:
      throw NError.emptyResult
    case 400:
      let errorMessage = parsingErrorResponse(data: data) ?? defaultMessage
      throw NError.custom(errorMessage)
    case 401:
      let errorMessage = parsingErrorResponse(data: data) ?? defaultMessage
      throw NError.custom(errorMessage)
    case 404:
      throw NError.notFound
    case 500...599:
      throw NError.internalServerError
    default:
      throw NError.unknownError
    }
  }

  public func validate(responseData response: AFDataResponse<Data>) -> Swift.Result<Data, NError> {
    let errorMessage = "Maaf, sistem kami sedang mengalami gangguan. Silakan coba lagi nanti."
    let statusCode = response.response?.statusCode ?? 500
    let unknownError: NError = .custom(errorMessage)

    inspectResponse(response)

    if 200...299 ~= statusCode {
      guard let data = response.data else {
        return .failure(unknownError)
      }
      return .success(data)
    } else if statusCode == 400 {
      guard let data = response.data else {
        return .failure(unknownError)
      }
      let errorMessage = parsingErrorResponse(data: data) ?? defaultMessage
      return .failure(.custom(errorMessage))
    } else if statusCode == 401 {
      return .failure(.unauthorized)
    } else if statusCode == 403 {
      guard let data = response.data else {
        return .failure(unknownError)
      }
      let errorMessage = parsingErrorResponse(data: data) ?? defaultMessage
      return .failure(.custom(errorMessage))
    } else if statusCode == 404 {
      return .failure(.notFound)
    } else if statusCode == 500 {
      return .failure(.internalServerError)
    } else {
      return .failure(unknownError)
    }
  }

  fileprivate func generateBoundaryString() -> String {
    return "Boundary-\(UUID().uuidString)"
  }


  // MARK: - Static

  static func createURLSesion() -> URLSession {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 180.0
    config.timeoutIntervalForResource = 180.0
    return URLSession(configuration: config)
  }

  public static func makeUrl(
    baseURL: String,
    path: String,
    queryItems: [String: String] = [:]
  ) -> URL? {
    var components = URLComponents(string: baseURL)!
    components.path = components.path.appending(path)
    if !queryItems.isEmpty {
      components.queryItems = queryItems.map {
        URLQueryItem(name: $0, value: $1)
      }
    }
    return components.url
  }

}


// MARK: - Connection Checker


protocol ConnectionChecker {
  var isConnected: Bool { get async }
}

public protocol NetworkConnectionChecker {
  var isConnected: Bool { get }
}

public struct NetworkConnectionChecker_V1: NetworkConnectionChecker {
  public init() {}
  public var isConnected: Bool {
    return ConnectionHelper.isInternetAvailable()
  }
}

public struct NetworkConnectionCheckerAsync: ConnectionChecker {
  public init() {}
  var isConnected: Bool {
    return ConnectionHelper.isInternetAvailable()
  }
}

public class ConnectionHelper {

  public static func internetAvailablity() -> Bool {
    if !self.isInternetAvailable() {
      print("You have to connect with internet")
      return false
    } else {
      return true
    }
  }

  public static func isInternetAvailable() -> Bool {

    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
    zeroAddress.sin_family = sa_family_t(AF_INET)

    guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
      $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
        SCNetworkReachabilityCreateWithAddress(nil, $0)
      }
    }) else {
      return false
    }

    var flags: SCNetworkReachabilityFlags = []
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
      return false
    }

    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)

    return (isReachable && !needsConnection)
  }
}

// MARK: - Services

/// A dictionary of headers to apply to a `URLRequest`.
typealias RequestHeaders = [String: String]
typealias RequestParameters = [String : Any]

enum Method {
  case get
  case post
  case put
  case delete
  case patch
}

enum Encoding {
  case url
  case json
}

protocol Service {
  func request<T: Codable>(
    of type: T.Type,
    with url: String,
    withMethod method: Method?,
    withHeaders headers: [String: String],
    withParameter parameters: [String: Any],
    withEncoding encoding: Encoding?,
    completion: @escaping(Result<T, NError>) -> Void
  )

  func combineRequest<T: Codable>(
    of type: T.Type,
    with url: String,
    withMethod method: Method?,
    withHeaders headers: [String: String],
    withParameter parameters: [String: Any],
    withEncoding encoding: Encoding?
  ) -> AnyPublisher<T, NError>

}

protocol LocalService {
  func parsingJSON<T>(of type: T.Type, from data: Data) -> Result<T, NError> where T: Codable
  func loadJsonFromFile(with url: String) -> Data
}


protocol RawService: Service {
  func requestRawJSON(
    with url: String,
    withMethod method: Method?,
    withHeaders headers: [String: String],
    withParameter parameters: [String: Any],
    withEncoding encoding: Encoding?,
    completion: @escaping(Result<String, NError>) -> Void
  )
}

// MARK: - Extension
extension Data {
  mutating func append(_ string: String) {
    if let data = string.data(using: .utf8) {
      append(data)
    }
  }
}


extension Encoding {
  func getEncoding() -> ParameterEncoding {
    switch self {
    case .url:
      return URLEncoding.default
    case .json:
      return JSONEncoding.default
    }
  }
}


extension Method {
  func getMethod() -> HTTPMethod {
    switch self {
    case .get:
      return HTTPMethod.get
    case .post:
      return HTTPMethod.post
    case .put:
      return HTTPMethod.put
    case .delete:
      return HTTPMethod.delete
    case .patch:
      return HTTPMethod.patch
    }
  }
}


// MARK: - Attachment Model

struct Attachment {
  let key: String
  let filename: String
  let data: Data
  let mimeType: String

  init(
    keyName key: String,
    fileName: String = "",
    attachment data: Data
  ) {
    self.key = key
    self.mimeType = "image/jpeg"
    self.filename = fileName.isEmpty ? UUID().uuidString : fileName
    self.data = data
  }
}

extension Data {

  public var prettyPrintedJSONString: NSString? {
    guard
      let object = try? JSONSerialization.jsonObject(with: self, options: []),
      let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
      let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    else {
      return nil
    }
    return prettyPrintedString
  }

}

