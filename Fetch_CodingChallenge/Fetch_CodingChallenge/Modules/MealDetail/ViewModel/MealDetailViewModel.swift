//
//  MealDetailViewModel.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/20/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    
    @MainActor @Published var mealDetail: MealDetail?
    
    func fetchMealDetail(mealId: String) {
        Task {
            do {
                let mealDetail = try await MealsDataManager().fetchMealDetails(mealId: mealId)
                DispatchQueue.main.async {
                    self.mealDetail = mealDetail.first
                }
            } catch {
                print("Failed to fetch meal recipe: \(error.localizedDescription)")
            }
        }
    }
}
