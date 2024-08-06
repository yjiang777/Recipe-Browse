//
//  Category.swift
//  Recipe Browse
//
//  Created by Yajing Jiang on 8/3/24.


import Foundation
struct CategoryResponse: Decodable {
    var categories: [Category]
}

struct Category: Decodable{
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
}

extension Category: Identifiable {
    var id: String {
        return idCategory
    }
}
