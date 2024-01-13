//
//  StudentRepo.swift
//  ProjectOne
//
//  Created by Aaditya shah on 11/01/2024.
//

import Foundation
import CoreData

struct StudentRepo {
    
    func createProduct(student: Student) {
        let dbStudent = DBStudent(context: PersistentStorage.shared.context)
        dbStudent.firstName = student.firstName
        dbStudent.lastName = student.lastName
        dbStudent.email = student.email
        dbStudent.password = student.password
       
        PersistentStorage.shared.saveContext()
    }
    
    
}
