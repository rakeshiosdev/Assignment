//
//  UserRepositoryProtocol.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser() async throws -> [UserDomainModel]
}
