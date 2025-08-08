//
//  ActivityIndicator.swift
//  TechAssignment
//
//  Created by Rakesh's Macbook Pro on 08/08/25.
//

import SwiftUI

struct DSActivityIndicator: View {
    var message: String? = nil
    var backgroundColor: Color = Color.black.opacity(0.4)
    var cornerRadius: CGFloat = 12

    var body: some View {
        ZStack {
            backgroundColor.opacity(0.7)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 16) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)

                if let message = message {
                    Text(message)
                        .foregroundColor(.white)
                        .font(.body)
                }
            }
            .padding(20)
            .background(Color.black.opacity(0.7))
            .cornerRadius(cornerRadius)
        }
    }
}
