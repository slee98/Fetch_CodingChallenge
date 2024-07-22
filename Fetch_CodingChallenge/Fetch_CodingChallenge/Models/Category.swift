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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        thumbnailURL = try container.decode(URL.self, forKey: .thumbnailURL)
        description = try container.decode(String.self, forKey: .description)
    }
}

struct CategoryAPIResponse: Codable {
    let categories: [Category]
}
