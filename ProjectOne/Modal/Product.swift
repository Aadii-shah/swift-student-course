//
//  Product.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 06/12/2023.
//

import Foundation

class Product {
    var name: String
    var image: String
    var price: String
    var unit: String
    var categoryId: String
    var productId: String
    
    init(name: String, image: String, price: String, unit: String, categoryId: String, productId: String) {
        self.name = name
        self.image = image
        self.price = price
        self.unit = unit
        self.categoryId = categoryId
        self.productId = productId
    }
}
