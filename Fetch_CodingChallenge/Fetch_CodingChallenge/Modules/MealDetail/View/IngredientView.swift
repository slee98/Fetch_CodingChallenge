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
                if let ingredient = meal.ingredients[index], !ingredient.isEmpty,
                   let measure = meal.measures[index], !measure.isEmpty {
                    VStack {
                        HStack {
                            Text(ingredient)
                                .font(.custom("OpenSans-Regular", size: 18))
                                .foregroundStyle(Color.black.opacity(0.5))
                                .padding(.vertical, 5)
                            Spacer()
                            Text(measure)
                                .font(.custom("OpenSans-Regular", size: 16))
                                .foregroundStyle(Color.black)
                                .fontWeight(.medium)
                        }
                        Divider()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 30)
                }
            }
        }
    }
}

#Preview {
    IngredientView(meal: MockData().mealDetail)
}
