//
//  SplashViewModel.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

@MainActor
final class SplashViewModel: ObservableObject {
    @Published var isFinished = false

    func initializeApp() async {
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        isFinished = true
    }
}
