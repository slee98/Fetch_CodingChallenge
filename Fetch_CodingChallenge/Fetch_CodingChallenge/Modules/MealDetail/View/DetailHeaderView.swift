//
//  DetailHeaderView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/18/24.
//

import SwiftUI

struct DetailHeaderView: View {
    
    let meal: MealDetail
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            AsyncImage(url: meal.thumbnailURL, content: { image in
                image
                    .resizable()
            }, placeholder: {
                ProgressView()
            })
            .frame(width: 400, height: 350)
            
            Spacer()
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Circle()
                        .fill(Color.white.opacity(0.8))
                        .frame(width: 34, height: 34)
                        .overlay {
                            Image(systemName: "chevron.left")
                                .frame(width: 9, height: 16)
                                .foregroundColor(Color.black.opacity(0.4))
                        }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, -130)
        }
    }
}

#Preview {
    DetailHeaderView(meal: MockData().mealDetail)
}
