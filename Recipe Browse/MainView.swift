//
//  ContentView.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.
//

import SwiftUI

struct MainView: View {
    // main view with two tab views, one for browse by category and another for search
    var body: some View {
        TabView{
            CategoryView().tabItem {
                VStack{
                    Image(systemName: "menucard")
                    Text("Category")
                }
            }
            SearchView()
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
