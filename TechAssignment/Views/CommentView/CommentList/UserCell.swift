//
//  UserCell.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 07/08/25.
//

import SwiftUI

private typealias Strings = UserListViewConstants.Strings

struct UserCell: View {
    let user: UserModel
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.neutralBlue)
                .frame(width: 60, height: 60)
                .overlay(
                    HStack(spacing: 0) {
                        Text(user.firstName.prefix(1))
                        Text(user.lastName.prefix(1))
                    }
                    .font(.system(size: 22, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.textGrayDark)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(user.fullName)
                    .font(.system(size: 22, weight: .regular, design: .rounded))
                    .foregroundColor(Color.neutralBlue)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 3)
        )
        .overlay(alignment: .trailing) {
            Image(systemName: "chevron.right")
                .frame(width: 24, height: 24, alignment: .trailing)
                .padding(.trailing, 16)
        }
    }
}

