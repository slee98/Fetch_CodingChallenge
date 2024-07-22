//
//  MealMock.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/18/24.
//

import Foundation

class MockData {
    
    let mealBaseList: [MealBase] = [
        MealBase(id: "52874", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")!, name: "Beef and Mustard Pie"),
        MealBase(id: "52878", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/wrssvt1511556563.jpg")!, name: "Beef and Oyster pie"),
        MealBase(id: "53071", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/pkopc31683207947.jpg")!, name: "Beef Asado"),
        MealBase(id: "52997", thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/z0ageb1583189517.jpg")!, name: "Beef Banh Mi Bowls with Sriracha Mayo, Carrot & Pickled Cucumber")
    ]
    
    let mealDetail: MealDetail = MealDetail(
        id: "52772",
        name: "Teriyaki Chicken Casserole",
        thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")!,
        category: "Chicken",
        instructions: """
        Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.
        Combine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.
        Meanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.
        Place the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.
        *Meanwhile, steam or cook the vegetables according to package directions.
        Add the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!
        """,
        ingredients: [
            "soy sauce",
            "water",
            "brown sugar",
            "ground ginger",
            "minced garlic",
            "cornstarch",
            "chicken breasts",
            "stir-fry vegetables",
            "brown rice"
        ],
        measures: [
            "3/4 cup",
            "1/2 cup",
            "1/4 cup",
            "1/2 teaspoon",
            "1/2 teaspoon",
            "4 Tablespoons",
            "2",
            "1 (12 oz.)",
            "3 cups"
        ]
    )
    
    let categoryList: [Category] = [
        Category(id: "1", name: "Beef", thumbnailURL: URL(string: "https://www.themealdb.com/images/category/beef.png"), description: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]")
    ]
}
