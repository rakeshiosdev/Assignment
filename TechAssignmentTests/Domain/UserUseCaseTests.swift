//
//  UserUseCaseTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import XCTest
@testable import TechAssignment

final class UserUseCaseTests: XCTestCase {
    func testUserUseCase_WhenFetchUserSucceeds_ReturnsUsers() async throws {
        // Create a mock repository with default user data
        let mockRepository = MockUserRepository()
        let useCase = UserUseCase(repository: mockRepository)
        
        let users = try await useCase.excute()
        
        // Verify the returned users match the expected data
        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users.first?.name, "Leanne Graham")
    }

    func testUserUseCase_WhenFetchUserFails_ThrowsError() async {
        // Create a mock repository configured to throw an error
        let mockRepository = MockUserRepository()
        mockRepository.shouldThrowError = true
        let useCase = UserUseCase(repository: mockRepository)
        
        // Execute the use case and confirm that an error is thrown
        do {
            _ = try await useCase.excute()
            XCTFail("Expected error to be thrown, but got success")
        } catch {
            XCTAssertTrue(error is NSError)
        }
    }
}

// Mock Repository
class MockUserRepository: UserRepositoryProtocol {
    var shouldThrowError = false
    
    func fetchUser() async throws -> [UserDomainModel] {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        }
        
        return [
            MockJson.userDomainModel
        ]
    }
}
