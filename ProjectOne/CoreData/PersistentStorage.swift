//
//  PersistentStorage.swift
//  CoreDataDemo
//
//  Created by Chandra Jayaswal on 08/12/2023.
//

import Foundation
import CoreData

final class PersistentStorage {
    
    private init () {
        
    }
    
    static let shared = PersistentStorage()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ProjectOne")
        container.loadPersistentStores { (description:NSPersistentStoreDescription, error: Error?) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        print("Creating Database")
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {
                return nil
            }
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
    
    func documentDirectory() -> String {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls[urls.count - 1] as URL
        return url.absoluteString
    }
    
}
