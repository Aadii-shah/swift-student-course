//
//  ProductRepo.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 15/12/2023.
//

import Foundation
import CoreData

struct ProductRepo {
    func createProduct(product: Product) {
        let dbProduct = DBProduct(context: PersistentStorage.shared.context)
        dbProduct.productId = UUID().uuidString
        dbProduct.categoryId = product.categoryId
        dbProduct.name = product.name
        dbProduct.image = product.image
        dbProduct.price = Int16(product.price) ?? 0
        dbProduct.unit = product.unit
        PersistentStorage.shared.saveContext()
    }
    
    func updateProduct(product: Product) {
        let  dbProduct = getProduct(productId: product.productId)
        guard let dbProduct = dbProduct else {
            return
        }
        dbProduct.productId = product.productId
        dbProduct.categoryId = product.categoryId
        dbProduct.name = product.name
        dbProduct.image = product.image
        dbProduct.price = Int16(product.price) ?? 0
        dbProduct.unit = product.unit
        PersistentStorage.shared.saveContext()
    }

    func getProducts(for categoryId:String) -> [Product]{
        
        let fetchRequest = NSFetchRequest<DBProduct>(entityName: "DBProduct")
        let predicate = NSPredicate(format: "categoryId==%@", categoryId as CVarArg)
        fetchRequest.predicate = predicate
        var products: [Product] = [Product]()

        do {
            let results = try PersistentStorage.shared.context.fetch(fetchRequest)
            results.forEach { dbProduct in
                let product = Product(name: dbProduct.name ?? "NA", image: dbProduct.image ?? "NA", price: "\(dbProduct.price)", unit: dbProduct.unit ?? "NA", categoryId: dbProduct.categoryId ?? "NA", productId: dbProduct.productId ?? "")
                products.append(product)
            }
        } catch {
            debugPrint(error)
        }
        return products
    }

    
    func deleteProduct(by productId: String) {
        let dbProduct = getProduct(productId: productId)
        guard let dbProduct = dbProduct else {
            return
        }
        PersistentStorage.shared.context.delete(dbProduct)
        PersistentStorage.shared.saveContext()
    }

    
    func getProduct(productId: String) -> DBProduct? {
        let fetchRequest = NSFetchRequest<DBProduct>(entityName: "DBProduct")
        let predicate = NSPredicate(format: "productId==%@", productId as CVarArg)
        fetchRequest.predicate = predicate

        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard let result = result else {
                return nil
            }
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
}
