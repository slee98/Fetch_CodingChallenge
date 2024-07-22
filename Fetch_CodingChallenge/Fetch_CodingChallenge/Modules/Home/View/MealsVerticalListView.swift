//
//  MealsVerticalListView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/20/24.
//

import SwiftUI

struct MealsVerticalListView: View {
    
    @Binding var mealSearchResult: [MealDetail]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(mealSearchResult, id: \.id) { meal in
                    NavigationLink(
                        value: meal,
                        label: {
                            HStack {
                                AsyncImage(url: meal.thumbnailURL, content: { image in
                                    image
                                        .resizable()
                                        .cornerRadius(4)
                                }, placeholder: {
                                    ProgressView()
                                })
                                .frame(width: 34, height: 34)
                                Text(meal.name)
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.system(size: 16))
                                    .frame(width: 170, height: 40, alignment: .topLeading)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                        }
                    )
                }
            }
            .navigationDestination(for: MealDetail.self) { meal in
                MealDetailView(meal: meal)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    @State var searchResults = [MockData().mealDetail]
    return MealsVerticalListView(mealSearchResult: $searchResults)
}
