//
//  UserUseCase.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

protocol UserUseCaseProtocol {
    func excute() async throws -> [UserDomainModel]
}

struct UserUseCase: UserUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func excute() async throws -> [UserDomainModel] {
        return try await repository.fetchUser()
    }
    
}
