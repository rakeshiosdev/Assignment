//
//  UserUseCaseTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import XCTest
@testable import TechAssignment

final class UserUseCaseTests: XCTestCase {
    
    // MARK: - Test Success Scenario
    func testUserUseCase_WhenFetchUserSucceeds_ReturnsUsers() async throws {
        // Arrange
        let mockRepository = MockUserRepository()
        let useCase = UserUseCase(repository: mockRepository)
        
        // Act
        let users = try await useCase.excute()
        
        // Assert
        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users.first?.name, "Leanne Graham")
    }

    // MARK: - Test Failure Scenario
    func testUserUseCase_WhenFetchUserFails_ThrowsError() async {
        // Arrange
        let mockRepository = MockUserRepository()
        mockRepository.shouldThrowError = true
        let useCase = UserUseCase(repository: mockRepository)
        
        // Act & Assert
        do {
            _ = try await useCase.excute()
            XCTFail("Expected error to be thrown, but got success")
        } catch {
            XCTAssertTrue(error is NSError)
        }
    }
}

// MARK: - Mock Repository
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
