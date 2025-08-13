//
//  RouterViewBuilderTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import XCTest
import SwiftUI
@testable import TechAssignment

final class RouterViewBuilderTests: XCTestCase {
    
    func testUserListRouteReturnsUserListView() {
        let route = AppRoute.userList
        let view = RouterViewBuilder.view(for: route)
        
        // Check if the view is UserListView
        let viewTypeName = String(describing: type(of: view))
        XCTAssertTrue(viewTypeName.contains("UserListView"))
    }

    func testUserDetailRouteReturnsUesrDetailView() {
        let user = MockJson.userModel
        
        let route = AppRoute.userDetail(user)
        let view = RouterViewBuilder.view(for: route)

        // Check if the view is UesrDetailView
        let viewTypeName = String(describing: type(of: view))
        XCTAssertTrue(viewTypeName.contains("UesrDetailView"))
    }
}
