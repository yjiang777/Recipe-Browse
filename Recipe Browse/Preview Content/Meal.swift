//
//  Meal.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.
//

import Foundation

struct MealResponse: Decodable {
    var meals: [Meal]
}

struct Meal: Decodable{
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

extension Meal: Identifiable {
    var id: String {
        return idMeal
    }
}
