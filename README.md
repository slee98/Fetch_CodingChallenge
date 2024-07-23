# Fetch Coding Challenge iOS Application
This repository contains an iOS application developed for the Fetch coding challenge. The app allows users to browse recipes by category, view meal recipes (ingredients, measurements, instructions), and search for meals by name.

## Demo
![Screenshot 2024-07-22 at 8 21 32 PM](https://github.com/user-attachments/assets/4f15d8b5-c470-4f59-9a55-e80bf8344f6f)
## Project Structure

The project is organized using the MVVM (Model-View-ViewModel) architecture as follows:

- **Models**: Contains the data models for categories, meals and meal details.
- **Views**: Contains SwiftUI views for displaying the list of meals and meal details.
- **ViewModels**: Contains the view models for handling data fetching and business logic related to views.
- **DataManagers**: Contains the network service for making API calls.

## Endpoints Used
- **Fetch Categories**: [https://themealdb.com/api/json/v1/1/categories.php](https://themealdb.com/api/json/v1/1/categories.php) - get a list of all meal categories.
- **Fetch Meals by Category**: [https://themealdb.com/api/json/v1/1/filter.php?c=Dessert](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert) - get a list of meals in the Dessert category.
- **Fetch Meal Details**: [https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID](https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID) - get details for a specific meal by its ID.
- **Search Meal by Name**: [https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata](https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata) - Searches for meals by name.
  
## Features

- 🔠 **Meal Categories**
  - Show users the list of meal categories.
    
- 👩‍🍳 **Meal List**
  - Allows users to see a list of meals in each category.
    
- 📄 **Meal Detail**
  - Provides users with meal instructions, ingredients, and measurements.

- 🔍 **Search Functionality**
  - Enables users to quickly find specific meals by name.
 
    
