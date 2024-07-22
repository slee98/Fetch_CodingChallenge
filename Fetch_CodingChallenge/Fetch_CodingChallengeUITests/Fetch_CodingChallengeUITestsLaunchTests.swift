//
//  Fetch_CodingChallengeUITestsLaunchTests.swift
//  Fetch_CodingChallengeUITests
//
//  Created by Soyeon Lee on 7/17/24.
//

import XCTest

final class Fetch_CodingChallengeUITestsLaunchTests: XCTestCase {
    
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testNavigateToMealDetail() {
        let app = XCUIApplication()
        app.launch()
        
        // Test main view launches correctly by looking for a welcome text.
        let welcomeText = app.staticTexts["What are you in the mood to make today?"]
        XCTAssert(welcomeText.exists)
        
        // Test that meal list is loading correctly by looking for a first meal item.
        let firstMealItemText = app.staticTexts["Beef Asado"]
        XCTAssert(firstMealItemText.waitForExistence(timeout: 5))
        
        // Test that tapping on a meal list item navigates and load meal detail view correctly by looking for static text "Ingredients" which only appears when meal detail data is available.
        firstMealItemText.tap()
        XCTAssert(firstMealItemText.waitForExistence(timeout: 5))
        
        let ingredientsText = app.buttons["Ingredients"]
        let instructionsText = app.buttons["Instructions"]
        XCTAssert(ingredientsText.exists)
        XCTAssert(instructionsText.exists)
    }
}

