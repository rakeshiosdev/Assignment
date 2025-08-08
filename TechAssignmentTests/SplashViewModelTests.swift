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

        // Before initialization, isFinished should be false
        XCTAssertFalse(viewModel.isFinished)

        // Run initializeApp (this will wait for 2 seconds)
        await viewModel.initializeApp()

        // After initialization, isFinished should be true
        XCTAssertTrue(viewModel.isFinished)
    }
}
