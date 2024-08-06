//
//  SearchView.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.
//

import SwiftUI

//Search view where you can search meal by ID
struct SearchView: View {
    
    @State private var inputText: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter Recipe ID", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                // Navigate into the recipe view after entering ID info and press search
                NavigationLink {RecipeView(receivedText: inputText)} label: {
                    Text("Search")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .navigationTitle("Search Recipe")
            }
        }
    }
}

#Preview {
    SearchView()
}
