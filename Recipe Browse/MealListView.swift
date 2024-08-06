//
//  MealListView.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.
//

import SwiftUI
// View that display list of meals by selected category from the last view
struct MealListView: View {
    @State private var meals = [Meal]()
    var receivedText: String
    @State private var selectedMeal = ""
    
    var body: some View {
        NavigationStack{
            // Display fetched meals of selected category from last view
            List (meals) { meal in
                HStack (spacing: 10) {
                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        ProgressView()
                    }
                    // Navigate to recipe view once select one meal
                    NavigationLink {RecipeView(receivedText: meal.idMeal)} label: {
                        Text(meal.strMeal)
                            .padding()
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                }
            }.navigationTitle(receivedText)
                .onAppear(){
                getMeals()
            }
        }
    }
    
    func getMeals(){
        Task {
            self.meals = await DataService().getMealsByCategory(term: receivedText)
            self.meals = self.meals.sorted { $0.strMeal < $1.strMeal } //ensure list are sorted alphabetically 
        }
    }
}

#Preview {
    MealListView(receivedText: "Dessert")
}
