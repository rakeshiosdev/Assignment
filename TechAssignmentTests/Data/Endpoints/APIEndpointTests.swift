//
//  APIEndpointTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 08/08/25.
//

import XCTest
@testable import TechAssignment

final class APIEndpointTests: XCTestCase {
    
    func testURLRequestForGETWithParameters() throws {
        // Given
        let baseURL = URL(string: "https://api.example.com")!
        let path = "/users"
        let method: HTTPMethod = .get
        let headers = ["Authorization": "Bearer token"]
        let parameters: [String: Any] = ["page": 1, "limit": 20]
        
        let endpoint = MockEndpoint (
            baseURL: baseURL,
            path: path,
            method: method,
            headers: headers,
            parameters: parameters
        )
        
        // When
            let request = try endpoint.urlRequest()
            
            // Then
            let expectedURLString = "https://api.example.com/users?page=1&limit=20"
            
            let actualComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
            let expectedComponents = URLComponents(string: expectedURLString)!
            
            // Compare scheme, host, and path of the URLs
            XCTAssertEqual(actualComponents.scheme, expectedComponents.scheme)
            XCTAssertEqual(actualComponents.host, expectedComponents.host)
            XCTAssertEqual(actualComponents.path, expectedComponents.path)
            
            // Compare query items while ignoring order
            let actualQueryItems = Set(actualComponents.queryItems ?? [])
            let expectedQueryItems = Set(expectedComponents.queryItems ?? [])
            XCTAssertEqual(actualQueryItems, expectedQueryItems)
            
            XCTAssertEqual(request.httpMethod, "GET")
            XCTAssertEqual(request.allHTTPHeaderFields, headers)
    }
    
    func testURLRequestWithoutParametersOrHeaders() throws {
        // Given
        let baseURL = URL(string: "https://api.example.com")!
        let path = "status"
        
        let endpoint = MockEndpoint(
            baseURL: baseURL,
            path: path,
            method: .get,
            headers: nil,
            parameters: nil
        )
        
        // When
        let request = try endpoint.urlRequest()
        
        // Then
        XCTAssertEqual(request.url?.absoluteString, "https://api.example.com/status")
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertTrue(request.allHTTPHeaderFields?.isEmpty ?? true)
    }
}

struct MockEndpoint: APIEndpoint {
    let baseURL: URL
    let path: String
    let method: HTTPMethod
    let headers: [String: String]?
    let parameters: [String: Any]?
}
