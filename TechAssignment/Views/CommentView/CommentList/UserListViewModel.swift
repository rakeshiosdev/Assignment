//
//  UserListViewModel.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    private(set) var isLoading = true
    
    private let userUseCase: UserUseCaseProtocol
    
    init(userUseCase: UserUseCaseProtocol = UserUseCase(repository: UserRepository())) {
        self.userUseCase = userUseCase
    }
    
    func fetchUser() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            let domainUser = try await userUseCase.excute()
            users = domainUser.map(UserModel.fromDomain)
        } catch {
            debugPrint(error)
        }
    }
}
