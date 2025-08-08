//
//  UserModelDTO.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

struct UserModelDTO: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressModelDTO
    let phone: String
    let website: String
    let company: CompanyModelDTO
}

struct AddressModelDTO: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoModelDTO
}

struct GeoModelDTO: Decodable {
    let lat: String
    let lng: String
}

struct CompanyModelDTO: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}
