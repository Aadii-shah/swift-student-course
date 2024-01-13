//
//  DBCategory+Extension.swift
//  CoreDataDemo
//
//  Created by Chandra Jayaswal on 13/12/2023.
//

import Foundation

extension DBCategory {
    
    func info() -> String {
        return "Id: \(self.categoryId ?? "NA"), Name: \(self.name ?? "NA"), Image: \(self.image  ?? "NA")"
    }
}
