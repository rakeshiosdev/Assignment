//
//  UserMapper.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import Foundation

struct UserMapper {
    static func toDomain(_ dto: UserModelDTO) -> UserDomainModel {
        UserDomainModel(
            id: dto.id,
            name: dto.name,
            username: dto.username,
            email: dto.email,
            address: AddressDomainModel(
                street: dto.address.street,
                suite: dto.address.suite,
                city: dto.address.city,
                zipcode: dto.address.zipcode,
                geo: GeoDomainModel(
                    lat: dto.address.geo.lat,
                    lng: dto.address.geo.lng
                )
            ),
            phone: dto.phone,
            website: dto.website,
            company: CompanyDomainModel(
                name: dto.company.name,
                catchPhrase: dto.company.catchPhrase,
                bs: dto.company.bs
            )
        )
    }
}

