//
//  DBProduct+CoreDataProperties.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 15/12/2023.
//
//

import Foundation
import CoreData


extension DBProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBProduct> {
        return NSFetchRequest<DBProduct>(entityName: "DBProduct")
    }

    @NSManaged public var productId: String?
    @NSManaged public var categoryId: String?
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var price: Int16
    @NSManaged public var unit: String?

}

extension DBProduct : Identifiable {

}
