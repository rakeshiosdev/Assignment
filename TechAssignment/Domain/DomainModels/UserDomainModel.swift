//
//  UserDomainModel.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

struct UserDomainModel {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressDomainModel
    let phone: String
    let website: String
    let company: CompanyDomainModel
}
struct AddressDomainModel {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoDomainModel
}

struct GeoDomainModel {
    let lat: String
    let lng: String
}

struct CompanyDomainModel {
    let name: String
    let catchPhrase: String
    let bs: String
}
