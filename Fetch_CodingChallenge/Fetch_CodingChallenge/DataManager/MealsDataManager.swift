//
//  MealsDataManager.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import Foundation

@MainActor
final class MealsDataManager: DataManager {
    
    func fetchMealsByCategory(categoryName: String) async throws -> [MealBase] {
        let decodedResponse: MealsAPIListResponse = try await performRequest(endpoint: "/filter.php?c=\(categoryName)")
        return decodedResponse.meals
    }
    
    func fetchMealDetails(mealId: String) async throws -> [MealDetail] {
        let decodedResponse: MealsAPIDetailResponse = try await performRequest(endpoint: "/lookup.php?i=\(mealId)")
        return decodedResponse.meals
    }
}
