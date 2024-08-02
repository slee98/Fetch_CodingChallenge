//
//  Category.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import Foundation

struct Category: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let thumbnailURL: URL?
    let description: String
}

extension Category {
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnailURL = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

struct CategoryAPIResponse: Codable {
    let categories: [Category]
}
