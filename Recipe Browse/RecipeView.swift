//
//  RecipeView.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.
//

import SwiftUI

struct RecipeView: View {
    
    @State private var recipes = [Recipe]()
    var receivedText: String
    @State private var ingredients: [String] = []
    @State private var measurements: [String] = []
    @State private var error: Bool = false

    var body: some View {
        VStack (spacing:0){
        // Error handling if wrong ID info was entered
            if error {
                Text("Fail to fetch recipe, please check recipe ID and try again")
            } else {
                List (recipes) { recipe in                    
                    AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                        image
                            .resizable()
                            .frame(height: UIScreen.main.bounds.height / 4)
                            .aspectRatio(contentMode: .fit)
                            .clipped().opacity(0.8)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(recipe.strMeal).font(.title).fontWeight(.thin)
                    
                // Scoll view for long instructions
                    ScrollView {
                        TextEditor(text: .constant(recipe.strInstructions)).frame(height: 200)
                    }
                // zip ingredients and measurements so they can be displayed at the same row
                    let combined = zip(ingredients, measurements).map { ($0, $1) }
                    VStack {
                        ForEach(combined.indices, id: \.self) { index in
                            HStack {
                                Text(combined[index].0).padding(.leading,20)
                                Spacer()
                                Text(combined[index].1).padding(.leading, 20)
                            }
                        }
                    }
                    
                } .edgesIgnoringSafeArea(.top).background(Color.clear)
                    .onAppear(){
                        displayIngredients()
                    }
            }
        }
    }
    
    func displayIngredients(){
        Task {
            self.recipes = await DataService().getRecipes(term: receivedText)
            if self.recipes.isEmpty {
                return error = true
            }
        // add measurements, ingredients to an array
            for r in self.recipes {
                let ingredientArray =  [r.strIngredient1,r.strIngredient2,r.strIngredient3,r.strIngredient4, r.strIngredient5,r.strIngredient6,r.strIngredient7,r.strIngredient8,r.strIngredient9,r.strIngredient10,r.strIngredient11,r.strIngredient12,
                                        r.strIngredient13,r.strIngredient14,r.strIngredient15,r.strIngredient16,
                                        r.strIngredient17,r.strIngredient18,r.strIngredient19,r.strIngredient20
                ]
                let measureArray = [r.strMeasure1,r.strMeasure2,r.strMeasure3,r.strMeasure4,r.strMeasure5,
                                    r.strMeasure6,r.strMeasure7,r.strMeasure8,r.strMeasure9,r.strMeasure10,r.strMeasure11,r.strMeasure12,r.strMeasure13,r.strMeasure14,r.strMeasure15,r.strMeasure16, r.strMeasure17,r.strMeasure18, r.strMeasure19,r.strMeasure20]
            // filter out nil, empty values, and empty spaces
                self.ingredients = ingredientArray.compactMap{$0?.trimmingCharacters(in: .whitespaces).isEmpty == false ? $0 : nil}
                self.measurements = measureArray.compactMap{$0?.trimmingCharacters(in: .whitespaces).isEmpty == false ? $0 : nil}
            }
        }
    }
}

#Preview {
    RecipeView(receivedText: "52802")
}

