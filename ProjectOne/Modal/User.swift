//
//  User.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 09/08/2023.
//

import Foundation

struct User {
    var userName: String
    var password: String
    
    func isValidUser() -> Bool {
        return userName == "chandra" && password == "chandra"
    }
    
    
}
