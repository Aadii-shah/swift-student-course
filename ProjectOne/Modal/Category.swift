//
//  Category.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 29/11/2023.
//

import Foundation

class Category {
    var name: String
    var image: String
    var categoryId: String
    var productList: Array = Array<Product>()
    
    init(name: String, image: String, categoryId: String) {
        self.name = name
        self.image = image
        self.categoryId = categoryId
    }
    
}
