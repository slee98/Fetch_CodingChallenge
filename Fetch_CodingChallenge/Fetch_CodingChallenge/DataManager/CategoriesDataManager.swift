//
//  CategoriesDataManager.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import Foundation

@MainActor
final class CategoriesDataManger: DataManager {
    
    func fetchCategories() async throws -> [Category]  {
        let decodedResponse: CategoryAPIResponse = try await performRequest(endpoint: "/categories.php")
        return decodedResponse.categories
    }
}
