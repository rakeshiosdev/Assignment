//
//  UserRepositoryTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import XCTest
@testable import TechAssignment

final class UserRepositoryTests: XCTestCase {
    func testFetchUser_ReturnsMappedDomainModels() async throws {
        // Arrange
        let mockUserDTO = MockJson.userModelDTO
        
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.mockUsers = [mockUserDTO]
        
        let repository = UserRepository(networkManager: mockNetworkManager)
        
        // Act
        let users = try await repository.fetchUser()
        
        // Assert
        XCTAssertEqual(users.count, 1)
        let user = users[0]
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.name, "Leanne Graham")
    }
}

class MockNetworkManager: NetworkManager {
    var mockUsers: [UserModelDTO] = []
    
    override func request<T: Decodable>(_ endPoint: APIEndpoint, type: T.Type) async throws -> T {
        if let users = mockUsers as? T {
            return users
        }
        throw NetworkError.unknown
    }
}
