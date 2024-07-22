//
//  SearchViewModel.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/20/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var mealSearchText: String = ""
    @Published var mealSearchResult: [MealDetail] = []
    
    private var mealSearchTextSubscription: AnyCancellable?
    
    init() {
        mealSearchTextSubscription = $mealSearchText
            .debounce(for: 0.4, scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.searchMeals(mealSearchText: text)
            }
    }
    
    func searchMeals(mealSearchText: String) {
        Task {
            do {
                let mealSearchResult = try await SearchDataManager().searchMeal(mealSearchText: mealSearchText)
                DispatchQueue.main.async {
                    self.mealSearchResult = mealSearchResult
                }
            } catch {
                print("Error searching meals: \(error.localizedDescription)")
            }
        }
    }
}
