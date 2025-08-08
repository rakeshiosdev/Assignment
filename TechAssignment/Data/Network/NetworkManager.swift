//
//  NetworkManager.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

public protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ endPoint: APIEndpoint, type: T.Type) async throws -> T
}

class NetworkManager: NetworkManagerProtocol {
    func request<T: Decodable>(_ endPoint: APIEndpoint, type: T.Type) async throws -> T {
        do {
            let request = try endPoint.urlRequest()
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.statusCode(httpResponse.statusCode)
            }
            
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch {
            throw NetworkError.unknown
        }
    }
}
