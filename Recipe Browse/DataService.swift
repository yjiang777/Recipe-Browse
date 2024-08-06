//
//  DataService.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.
//

import Foundation
// dataservice class that manages different functions that makes API calls
struct DataService {
    private let baseURL = "https://www.themealdb.com/api/json/v1/1"
    // get JSON data from endpoint, parse response through decoder then return as a list of category objects
    func getCategories() async -> [Category] {
        let urlString = baseURL + "/categories.php"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let categoryData = try decoder.decode(CategoryResponse.self, from: data)
                return categoryData.categories
            }
            catch {
                print(error)
            }
        }
        return [Category]()
    }
    
    func getMealsByCategory(term: String) async -> [Meal] {
        let urlString = baseURL + "/filter.php?c=\(term)"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode(MealResponse.self, from: data)
                return recipeData.meals
            }
            catch {
                print(error)
            }
        }
        return [Meal]()
    }
    
    func getRecipes(term: String) async -> [Recipe] {
        let urlString = baseURL + "/lookup.php?i=\(term)"
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let ingredientsData = try decoder.decode(RecipeResponse.self, from: data)
                return ingredientsData.meals
            }
            catch {
                print(urlString)
                print(error)
            }
        }
        return [Recipe]()
    }
    
}
