//
//  UserListEndpoint.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

enum UserListEndpoint: APIEndpoint {
    case gateUser
    
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .gateUser:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .gateUser:
            return .get
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
}
