//
//  CategoriesView.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.
//

import SwiftUI
// view that display different categories that can be browsed
struct CategoryView: View {
    @State private var categories = [Category]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 10){
                    ForEach(categories) {category in
                        // Navigate into the list of meals by selected category
                        NavigationLink {
                            MealListView(receivedText: category.strCategory)
                        } label:{
                            Text(category.strCategory)
                        }
                    }
                }.padding(.top, 100)
            }
        }.onAppear(){
            getCategories() //call function to get list of categories
        }
    }
    
    // function that triggers dataService class to make API call that gets all categories
    func getCategories(){
        Task {
            self.categories = await DataService().getCategories()
        }
    }
}

#Preview {
    CategoryView()
}
