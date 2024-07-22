# Fetch Coding Challenge iOS Application
This repository contains an iOS application developed for the Fetch coding challenge. The app allows users to browse recipes by category, view meal recipes (ingredients, measurements, instructions), and search for meals by name.

## Demo


## Project Structure

The project is organized using the MVVM (Model-View-ViewModel) architecture as follows:

- **Models**: Contains the data models for meals and meal details.
- **Views**: Contains SwiftUI views for displaying the list of meals and meal details.
- **ViewModels**: Contains the view models for handling data fetching and business logic.
- **Services**: Contains the network service for making API calls.

This app is designed to browse recipes and search for meals using the provided API.

## Endpoints Used
- **Fetch Meals by Category**: [https://themealdb.com/api/json/v1/1/filter.php?c=Dessert](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert) - get a list of meals in the Dessert category.
- **Fetch Meal Details**: [https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID](https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID) - geget details for a specific meal by its ID.
- **Search Meal by Name**: [https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata](https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata) - Searches for meals by name.
  
## Features

- 👩‍🍳 **Meal List**
  - Allows users to browse a list of meals in each category.
    
- 📄 **Meal Detail**
  - Provides users with meal instructions, ingredients, and measurements.

- 🔠 **Meal Categories**
  - Show users the list of meal categories.

- 🔍 **Search Functionality**
  - Enables users to quickly find specific meals
 
 
 ### Prerequisites

- Xcode 12 or later
- iOS 14.0 or later

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/fetch-coding-challenge.git
    ```

2. Open the project in Xcode:
    ```sh
    cd fetch-coding-challenge
    open FetchCodingChallenge.xcodeproj
    ```

3. Install dependencies (if any):
    ```sh
    pod install
    ```

4. Build and run the project in Xcode.

## Usage

1. Launch the app on your device or simulator.
2. Browse recipes by selecting a category.
3. View detailed information about a meal by selecting it.
4. Use the search bar to find meals by name.
