//
//  UserListView.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import SwiftUI

private typealias Strings = UserListViewConstants.Strings

struct UserListView: View {
    @EnvironmentObject var router: NavigationRouter
    
    @StateObject private var viewModel = UserListViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground) // Match this to your desired background
                .ignoresSafeArea()
            List {
                ForEach(viewModel.users) { user in
                    UserCell(user: user)
                        .onTapGesture {
                            router.push(.userDetail(user))
                        }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .overlay(alignment: .center, content: {
            if viewModel.isLoading {
                DSActivityIndicator(message: "Loading...", backgroundColor: Color.neutralBlue)
            }
        })
        .task {
            await viewModel.fetchUser()
        }
        .navigationTitle(Strings.navBarTitle)
    }
}

#Preview {
    UserListView()
}
