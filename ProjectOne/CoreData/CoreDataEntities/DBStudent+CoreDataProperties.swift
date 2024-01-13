//
//  DBStudent+CoreDataProperties.swift
//  ProjectOne
//
//  Created by Aaditya shah on 11/01/2024.
//
//

import Foundation
import CoreData


extension DBStudent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBStudent> {
        return NSFetchRequest<DBStudent>(entityName: "DBStudent")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension DBStudent : Identifiable {

}
