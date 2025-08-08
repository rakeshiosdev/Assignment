//
//  APIEndpoint.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

public protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

extension APIEndpoint {
   func urlRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
       var request = URLRequest(url: url)
       request.httpMethod = method.rawValue
       
       if let headers = headers {
           request.allHTTPHeaderFields = headers
       }
       
       if let parameters = parameters {
           if method == .get {
               var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
               components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
               request.url = components?.url
           }
       }
       
       return request
    }
}
