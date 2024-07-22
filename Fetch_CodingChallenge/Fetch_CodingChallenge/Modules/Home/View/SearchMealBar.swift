//
//  SearchMealBar.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import SwiftUI

struct SearchMealBar: View {
    
    @Binding var searchText: String
    @Binding var isSearchBarClicked: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(Color.black.opacity(0.5))
            TextField("Search recipes...", text: $searchText)
                .foregroundStyle(Color.black)
                .font(.system(size: 16))
            Spacer()
        }
        .padding()
        .frame(width: isSearchBarClicked ? 290 : 350)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: isSearchBarClicked ? 290 : 350, height: 45)
                .shadow(color: Color(.gray).opacity(0.5), radius: 3, x: 0, y: 0)
        )
        .onTapGesture {
            isSearchBarClicked = true
        }
    }
}

#Preview {
    @State var isSearchBarClicked: Bool = true
    @State var searchText: String = ""
    return SearchMealBar(searchText: $searchText, isSearchBarClicked: $isSearchBarClicked)
}
