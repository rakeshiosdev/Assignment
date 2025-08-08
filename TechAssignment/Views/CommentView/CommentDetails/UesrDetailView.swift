//
//  UesrDetailView.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 06/08/25.
//

import SwiftUI

private typealias Strings = UserListViewConstants.Strings

struct UesrDetailView: View {
    @EnvironmentObject var router: NavigationRouter
    let user: UserModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.lightBlue.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 30) {
                HStack(spacing: 20) {
                    Image("dummy_profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .cornerRadius(60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 60)
                                .stroke(Color.neutralBlue, lineWidth: 3)
                        )
                        .shadow(radius: 5)
                    
                    Text(user.fullName)
                        .font(.system(size: 24, weight: .regular, design: .monospaced))
                        .foregroundColor(Color.neutralBlue)
                }
                
                VStack(alignment: .center, spacing: 15) {
                    userInfo(label: "\(Strings.userEmailTitle): ", value: user.email)
                    userInfo(label: "\(Strings.userWebsiteTitle): ", value: user.website)
                    userInfo(label: "\(Strings.userContactTitle): ", value: user.phone)
                }
                .font(.body)
                .foregroundColor(.primary)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 3)
                )
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    router.pop()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func userInfo(label: String, value: String) -> some View {
        HStack(alignment: .top) {
            Text(label)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(Color.neutralGray)
            Text(value)
                .font(.system(size: 20, weight: .regular, design: .rounded))
                .foregroundColor(Color.textGray)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
