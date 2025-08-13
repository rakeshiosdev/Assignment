//
//  SplashViewModelTests.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import XCTest
@testable import TechAssignment

@MainActor
final class SplashViewModelTests: XCTestCase {
    
    func testInitializeAppSetsIsFinishedToTrue() async {
        let viewModel = SplashViewModel()

        XCTAssertFalse(viewModel.isFinished)

        await viewModel.initializeApp()

        XCTAssertTrue(viewModel.isFinished)
    }
}
