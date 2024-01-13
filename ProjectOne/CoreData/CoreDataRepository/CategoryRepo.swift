//
//  CategoryRepo.swift
//  CoreDataDemo
//
//  Created by Chandra Jayaswal on 13/12/2023.
//

import Foundation
import CoreData

struct CategoryRepo {
    
    func createCategory(name: String, imageName: String) {
        let dbCategory = DBCategory(context: PersistentStorage.shared.context)
        dbCategory.categoryId = UUID().uuidString
        dbCategory.name = name
        dbCategory.image = imageName
        PersistentStorage.shared.saveContext()
    }
    
    func getCategories() -> [Category]{
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: DBCategory.self)
        
        var categories: [Category] = [Category]()
        
        guard let result = result else {
            return categories
        }
        
        result.forEach { dbCategory in
            let category = Category(name: dbCategory.name ?? "NA", image: dbCategory.image ?? "NA", categoryId: dbCategory.categoryId ?? "NA")
            categories.append(category)
        }
        
        return categories
    }
    
    func deleteCategories() {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: DBCategory.self)
        guard let records = result else {
            return
        }
        records.forEach { dbCategory in
            PersistentStorage.shared.context.delete(dbCategory)
        }
        PersistentStorage.shared.saveContext()
    }
    
    func deleteCategory(by categoryId: String) {
        let dbCategory = category(categoryId: categoryId)
        guard let dbCategory = dbCategory else {
            return
        }
        PersistentStorage.shared.context.delete(dbCategory)
        PersistentStorage.shared.saveContext()
    }
    
    func category(categoryId: String) -> DBCategory? {
        let fetchRequest = NSFetchRequest<DBCategory>(entityName: "DBCategory")
        let predicate = NSPredicate(format: "categoryId==%@", categoryId as CVarArg)
        fetchRequest.predicate = predicate

        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {
                return nil
            }
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
    
}
