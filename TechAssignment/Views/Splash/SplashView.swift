//
//  SplashView.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    @StateObject private var router = NavigationRouter()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.gradientStartColor, .gradientEndColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            Group {
                if viewModel.isFinished {
                    NavigationStack(path: $router.path) {
                        UserListView()
                            .navigationDestination(for: AppRoute.self) { route in
                                RouterViewBuilder.view(for: route)
                            }
                    }
                    .environmentObject(router)
                    .tint(.black)
                } else {
                    ZStack {
                        Color.blue.opacity(0.5)
                            .ignoresSafeArea()
                        
                        VStack {
                            Text("Tech Assignment")
                                .font(.system(size: 24, weight: .bold, design: .monospaced))
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.initializeApp()
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
