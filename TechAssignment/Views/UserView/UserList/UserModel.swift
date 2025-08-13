//
//  UserModel.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import Foundation

struct UserModel: Identifiable, Hashable {
    let id: Int
    let fullName: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let website: String

    static func fromDomain(_ domain: UserDomainModel) -> UserModel {
        UserModel(
            id: domain.id,
            fullName: domain.name,
            firstName: splitName(domain.name).firstName,
            lastName: splitName(domain.name).lastName,
            email: domain.email,
            phone: domain.phone,
            website: domain.website
        )
    }
    
    private static func splitName(_ fullName: String) ->(firstName: String, lastName: String) {
        let separatedName = fullName.split(separator: " ")
        return (firstName: String(separatedName.first ?? ""), lastName: String(separatedName.last ?? ""))
    }
}
