//
//  RouterViewBuilder.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import SwiftUI

enum AppRoute: Hashable {
    case userList
    case userDetail(UserModel)
}

struct RouterViewBuilder {
    @ViewBuilder
    static func view(for route: AppRoute) -> some View {
        switch route {
        case .userList:
            UserListView()
        case .userDetail(let user):
            UesrDetailView(user: user)
        }
    }
}
