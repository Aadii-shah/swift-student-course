//
//  DBCategory+CoreDataProperties.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 14/12/2023.
//
//

import Foundation
import CoreData


extension DBCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBCategory> {
        return NSFetchRequest<DBCategory>(entityName: "DBCategory")
    }

    @NSManaged public var categoryId: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?

}

extension DBCategory : Identifiable {

}
