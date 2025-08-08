//
//  MockJson.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 08/08/25.
//

import Foundation
@testable import TechAssignment

enum MockJson {
    static let userModel = UserModel(
        id: 1,
        fullName: "Leanne Graham",
        firstName: "Leanne",
        lastName: "Graham",
        email: "sincere@april.biz",
        phone: "1-770-736-8031",
        website: "hildegard.org"
    )
    
    static let userModelDTO = UserModelDTO(
        id: 1,
        name: "Leanne Graham",
        username: "Leanne",
        email: "sincere@april.biz",
        address: AddressModelDTO(
            street: "Kulas Light",
            suite: "Apt. 556",
            city: "Gwenborough",
            zipcode: "92998-3874",
            geo: GeoModelDTO(lat: "-37.3159", lng: "81.1496")
        ),
        phone: "123-456-7890",
        website: "hildegard.org",
        company: CompanyModelDTO(
            name: "Deckow-Crist",
            catchPhrase: "Multi-layered client-server neural-net",
            bs: "harness real-time e-markets"
        )
    )
    
    static let userDomainModel = UserDomainModel(
        id: 1,
        name: "Leanne Graham",
        username: "Leanne",
        email: "sincere@april.biz",
        address: AddressDomainModel(
            street: "Kulas Light",
            suite: "Apt. 556",
            city: "Gwenborough",
            zipcode: "92998-3874",
            geo: GeoDomainModel(lat: "-37.3159", lng: "81.1496")
        ),
        phone: "123-456-7890",
        website: "hildegard.org",
        company: CompanyDomainModel(
            name: "Deckow-Crist",
            catchPhrase: "Multi-layered client-server neural-net",
            bs: "harness real-time e-markets"
        )
    )
}
