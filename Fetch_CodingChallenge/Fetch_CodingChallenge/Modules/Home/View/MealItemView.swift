//
//  MealItemView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/19/24.
//

import SwiftUI

struct MealItemView: View {
    let meal: MealBase
    
    var body: some View {
        VStack {
            AsyncImage(url: meal.thumbnailURL, content: { image in
                image
                    .resizable()
                    .cornerRadius(8)
            }, placeholder: {
                ProgressView()
            })
            .frame(width: 170, height: 170)
            Text(meal.name)
                .foregroundColor(.black)
                .bold()
                .font(.system(size: 16))
                .frame(width: 170, height: 40, alignment: .topLeading)
        }
    }
}

#Preview {
    MealItemView(meal: MockData().mealBaseList[0])
}
