//
//  IngredientView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/18/24.
//

import SwiftUI

struct IngredientView: View {
    
    let meal: MealDetail
    
    var body: some View {
        Divider()
            .frame(height: 2)
            .foregroundColor(.gray)
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<meal.ingredients.count, id: \.self) { index in
                if let ingredient = meal.ingredients[index],
                   let measure = meal.measures[index] {
                    VStack {
                        HStack {
                            Text(ingredient)
                                .font(.system(size: 18))
                                .foregroundStyle(Color.black.opacity(0.5))
                                .padding(.vertical, 5)
                            Spacer()
                            Text(measure)
                                .font(.system(size: 18))
                                .foregroundStyle(Color.black)
                                .fontWeight(.medium)
                        }
                        Divider()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

#Preview {
    IngredientView(meal: MockData().mealDetail)
}
