//
//  SearchMealView.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/20/24.
//

import SwiftUI

struct SearchMealView: View {
    
    @Binding var isSearchBarClicked: Bool
    @ObservedObject var searchViewModel: SearchViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                SearchMealBar(searchText: $searchViewModel.mealSearchText, isSearchBarClicked: $isSearchBarClicked)
                Button {
                    isSearchBarClicked = false
                } label: {
                    Text("Cancel")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray.opacity(0.5))
                }
            }
            .padding(.horizontal, 10)
            
            MealsVerticalListView(mealSearchResult: $searchViewModel.mealSearchResult)
                .padding()
            
            Spacer()
        }
        .ignoresSafeArea(.all)
        .padding(.top, 10)
    }
}

#Preview {
    @State var isSearchBarClicked: Bool = true
    let searchViewModel = SearchViewModel()
    return SearchMealView(isSearchBarClicked: $isSearchBarClicked, searchViewModel: searchViewModel)
}
