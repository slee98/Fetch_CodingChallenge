//
//  CategoryListView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import SwiftUI

struct CategoryListView: View {
    
    @ObservedObject var categoryViewModel: CategoryViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(categoryViewModel.categories, id: \.id) { category in
                    Button(action: {
                        categoryViewModel.selectedCategory = category
                    }, label: {
                        VStack {
                            AsyncImage(url: category.thumbnailURL, content: { image in
                                image
                                    .resizable()
                            }, placeholder: {
                                ProgressView()
                            })
                            .frame(width: categoryViewModel.selectedCategory?.id == category.id ? 70 : 60, height: categoryViewModel.selectedCategory?.id == category.id ? 50 : 40)
                            Text(category.name)
                                .foregroundStyle(.black)
                                .font(.system(size: 14))
                                .fontWeight(categoryViewModel.selectedCategory?.id == category.id ? .medium : .regular)
                        }
                    })
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .onAppear {
            categoryViewModel.fetchCategory()
        }
    }
}

#Preview {
    let categoryViewModel = CategoryViewModel()
    categoryViewModel.categories = MockData().categoryList
    return CategoryListView(categoryViewModel: categoryViewModel)
}
