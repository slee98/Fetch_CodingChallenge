//
//  SearchDataManager.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/20/24.
//

import Foundation

@MainActor
final class SearchDataManager: DataManager {
    
    func searchMeal(mealSearchText: String) async throws -> [MealDetail] {
        let decodedResponse: MealsAPIDetailResponse = try await performRequest(endpoint: "/search.php?s=\(mealSearchText)")
        return decodedResponse.meals
    }
}
