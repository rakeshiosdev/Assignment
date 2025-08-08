//
//  UserRepository.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

class UserRepository: UserRepositoryProtocol {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
            self.networkManager = networkManager
        }
    
    func fetchUser() async throws -> [UserDomainModel] {
        let result = try await networkManager.request(UserListEndpoint.gateUser, type: [UserModelDTO].self)
        return result.map(UserMapper.toDomain)
    }
}
