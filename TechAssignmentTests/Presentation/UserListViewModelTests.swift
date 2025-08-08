//
//  UserListViewModelTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import XCTest
@testable import TechAssignment // Replace with actual module name

@MainActor
final class UserListViewModelTests: XCTestCase {
    
    func test_fetchUser_success() async {
        // Arrange
        let mockUseCase = MockUserUseCase()
        mockUseCase.mockUsers = [MockJson.userDomainModel]
        
        let viewModel = UserListViewModel(userUseCase: mockUseCase)
        
        // Act
        await viewModel.fetchUser()
        
        // Assert
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false after fetch completes")
        XCTAssertEqual(viewModel.users.count, 1)
        XCTAssertEqual(viewModel.users[0].fullName, "Leanne Graham")
    }
    
    func test_fetchUser_failure() async {
        // Arrange
        let mockUseCase = MockUserUseCase()
        mockUseCase.shouldThrowError = true
        let viewModel = UserListViewModel(userUseCase: mockUseCase)
        
        // Act
        await viewModel.fetchUser()
        
        // Assert
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false even after failure")
        XCTAssertTrue(viewModel.users.isEmpty)
    }
}


class MockUserUseCase: UserUseCaseProtocol {
    var shouldThrowError = false
    var mockUsers: [UserDomainModel] = []
    
    func excute() async throws -> [UserDomainModel] {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: -1, userInfo: nil)
        }
        return mockUsers
    }
}
