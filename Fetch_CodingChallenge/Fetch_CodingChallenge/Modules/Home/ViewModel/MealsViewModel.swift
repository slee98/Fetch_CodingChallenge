//
//  MealsViewModel.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import Foundation

// This class is an observable object that manages meal data and details.
class MealsViewModel: ObservableObject {
    
    @MainActor @Published var mealList: [MealBase] = []
    
    func fetchMeals(by category: Category?) {
        guard let category = category else {
            return
        }
        Task {
            do {
                let mealList = try await MealsDataManager().fetchMealsByCategory(categoryName: category.name)
                // Sort the mealList alphabetically by meal names
                let sortedMealList = mealList.sorted { $0.name < $1.name }
                DispatchQueue.main.async {
                    self.mealList = sortedMealList
                }
            } catch {
                print("Failed to fetch meals by category: \(error.localizedDescription)")
            }
        }
    }
}
