//
//  CategoryViewModel.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import Foundation

// This class is an observable object that manages category data and selection state.
class CategoryViewModel: ObservableObject {
    
    @MainActor @Published var categories: [Category] = []
    @MainActor @Published var selectedCategory: Category?
    
    func fetchCategory() {
        Task {
            do {
                let categories = try await CategoriesDataManger().fetchCategories()
                DispatchQueue.main.async {
                    self.categories = categories
                    self.selectedCategory = categories.first
                }
            } catch {
                print("Failed to fetch categories: \(error.localizedDescription)")
            }
        }
    }
}
