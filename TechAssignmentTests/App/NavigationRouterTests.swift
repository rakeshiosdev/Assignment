//
//  NavigationRouterTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import XCTest
@testable import TechAssignment

final class NavigationRouterTests: XCTestCase {
    
    var router: NavigationRouter!
    
    override func setUp() {
        super.setUp()
        router = NavigationRouter()
    }

    override func tearDown() {
        router = nil
        super.tearDown()
    }
    
    func testPushRouteAddsToPath() {
        let route = AppRoute.userList
        router.push(route)
        
        XCTAssertEqual(router.path.count, 1)
    }
    
    func testPopRouteRemovesLastRoute() {
        let route1 = AppRoute.userList
        let route2 = AppRoute.userDetail(MockJson.userModel)
        router.push(route1)
        router.push(route2)
        
        router.pop()
        
        XCTAssertEqual(router.path.count, 1)
    }

    func testPopOnEmptyPathDoesNothing() {
        router.pop()
        XCTAssertEqual(router.path.count, 0)
    }

    func testPopToRootClearsAllRoutes() {
        router.push(.userList)
        router.push(.userDetail(MockJson.userModel))
        
        router.popToRoot()
        
        XCTAssertEqual(router.path.count, 0)
    }
}
