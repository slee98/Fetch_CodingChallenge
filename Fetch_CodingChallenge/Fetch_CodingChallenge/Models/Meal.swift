//
//  Meal.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import Foundation

protocol MealBaseProtocol: Codable, Hashable {
    var id: String { get }
    var thumbnailURL: URL { get }
    var name: String { get }
}

struct MealBase: MealBaseProtocol {
    let id: String
    let thumbnailURL: URL
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case thumbnailURL = "strMealThumb"
        case name = "strMeal"
    }
}

struct MealDetail: MealBaseProtocol {
    let id: String
    let name: String
    let thumbnailURL: URL
    let category: String
    let instructions: String
    let ingredients: [String?]
    let measures: [String?]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case instructions = "strInstructions"
        case thumbnailURL = "strMealThumb"
    }
    
    enum AdditionalKeys: String, CodingKey {
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        thumbnailURL = try container.decode(URL.self, forKey: .thumbnailURL)
        category = try container.decode(String.self, forKey: .category)
        instructions = try container.decode(String.self, forKey: .instructions)
        
        let additionalContainer = try decoder.container(keyedBy: AdditionalKeys.self)
        ingredients = (1...20).map { index in
            guard let key = AdditionalKeys(stringValue: "strIngredient\(index)") else { return nil }
            return try? additionalContainer.decodeIfPresent(String.self, forKey: key)
        }
        
        measures = (1...20).map { index in
            guard let key = AdditionalKeys(stringValue: "strMeasure\(index)") else { return nil }
            return try? additionalContainer.decodeIfPresent(String.self, forKey: key)
        }
    }
    
    init(id: String, name: String, thumbnailURL: URL, category: String, instructions: String, ingredients: [String?], measures: [String?]) {
        self.id = id
        self.name = name
        self.thumbnailURL = thumbnailURL
        self.category = category
        self.instructions = instructions
        self.ingredients = ingredients
        self.measures = measures
    }
}

struct MealsAPIResponse<T: Codable>: Codable {
    let meals: [T]
}

typealias MealsAPIListResponse = MealsAPIResponse<MealBase>
typealias MealsAPIDetailResponse = MealsAPIResponse<MealDetail>

