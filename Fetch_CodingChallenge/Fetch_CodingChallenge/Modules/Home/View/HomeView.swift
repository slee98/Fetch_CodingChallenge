//
//  HomeView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import SwiftUI

struct HomeView: View {
    
    let mealsViewModel = MealsViewModel()
    @StateObject var categoryViewModel = CategoryViewModel()
    @StateObject var searchViewModel = SearchViewModel()
    @State private var isSearchBarClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isSearchBarClicked {
                    SearchMealView(isSearchBarClicked: $isSearchBarClicked, searchViewModel: searchViewModel)
                } else {
                    GreedingHeadLineView()
                    SearchMealBar(searchText: $searchViewModel.mealSearchText, isSearchBarClicked: $isSearchBarClicked)
                    CategoryListView(categoryViewModel: categoryViewModel)
                    MealListView(selectedCategory: $categoryViewModel.selectedCategory, mealsViewModel: mealsViewModel)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
