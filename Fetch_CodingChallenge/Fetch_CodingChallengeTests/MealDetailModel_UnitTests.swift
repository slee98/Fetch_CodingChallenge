//
//  MealDetailModel_UnitTests.swift
//  MealDetailModel_UnitTests
//
//  Created by Soyeon Lee on 7/17/24.
//

import XCTest
@testable import Fetch_CodingChallenge

final class MealDetailModel_UnitTests: XCTestCase {
    
    /**
     MealDetail model uses custom decoding logic for more friendly property names and scalable data store (ingredients and measures).
     Test decoding logic to make sure custom decoding is successful for each of custom decoded fields.
     */
    func testDecodingJSONResponse() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "MealDetailResponse", withExtension: "json") else {
            XCTFail("Missing file: MealDetailResponse.json")
            return
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let mealsAPIDetailResponse = try decoder.decode(MealsAPIDetailResponse.self, from: data)
        guard let mealDetail = mealsAPIDetailResponse.meals.first else {
            XCTFail("Missing meal detail mock data")
            return
        }
        
        XCTAssertEqual(mealDetail.id, "52772")
        XCTAssertEqual(mealDetail.name, "Teriyaki Chicken Casserole")
        XCTAssertEqual(mealDetail.category, "Chicken")
        // This instruciton is too long, just test for existance.
        XCTAssert(!mealDetail.instructions.isEmpty)
        XCTAssertEqual(mealDetail.thumbnailURL.absoluteString, "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")
        XCTAssertEqual(mealDetail.ingredients.count, 20)
        XCTAssertEqual(mealDetail.measures.count, 20)
    }
}
