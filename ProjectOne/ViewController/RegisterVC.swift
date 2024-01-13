//
//  RegisterVC.swift
//  ProjectOne
//
//  Created by Aaditya shah on 10/01/2024.
//

import UIKit
import CoreData

class RegisterVC: BaseVC {
    
    var registeredStudents: [Student] = []

    @IBOutlet weak var emailAddresstext: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnRegister(_ sender: Any) {
        guard let firstName = txtFirstName.text,
              let lastName = txtLastName.text,
              let email = emailAddresstext.text,
              let password = passwordtxt.text,
              !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty else {
            showAlert(message: "Please fill in all fields.")
            return
            
        }
        
        // Validate email format (you can use a more sophisticated validation logic)
             if !isValidEmail(email) {
                 showAlert(message: "Please enter a valid email address.")
                 return
             }
        
        // Check if the email is already registered (you might need to implement this logic)
                if isEmailRegistered(email) {
                    showAlert(message: "Email is already registered.")
                    return
                }
        
        // Create a new student instance and add it to the array
            let newStudent = Student(firstName: firstName, lastName: lastName, email: email, password: password)
            registeredStudents.append(newStudent)
        
        // Save the student data to CoreData
        // Save the student data to CoreData (you can add this logic if needed)
            saveStudentToCoreData(firstName: firstName, lastName: lastName, email: email, password: password)
            

              // Navigate to the homepage (you might want to implement this method)
             moveToLoginVC()
        
    }
    
    // Helper method to validate email format
       private func isValidEmail(_ email: String) -> Bool {
           // Implement your email validation logic
           // Example: Regular expression for a simple email format
           let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
       }
    
    
    // Helper method to check if the email is already registered (you need to implement this)
       private func isEmailRegistered(_ email: String) -> Bool {
           // Implement your logic to check if the email is already registered in CoreData
           // Example: Fetch from CoreData and check if any object has the given email
           // You can use the Core Data NSFetchRequest for this purpose
           // Return true if email is found, false otherwise
           // ...
           return false
       }
    
    private func saveStudentToCoreData(firstName: String, lastName: String, email: String, password: String) {
        // Access the Core Data managedObjectContext
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }

        let managedContext = PersistentStorage.shared.context

        // Create a new student object
        let studentEntity = NSEntityDescription.entity(forEntityName: "Student", in: managedContext)!
        let student = NSManagedObject(entity: studentEntity, insertInto: managedContext)

        // Set values for the student attributes
        student.setValue(firstName, forKey: "firstName")
        student.setValue(lastName, forKey: "lastName")
        student.setValue(email, forKey: "email")
        student.setValue(password, forKey: "password")

        // Save the managedObjectContext with error handling
        do {
            try managedContext.save()
            print("Student data saved to CoreData.")
        } catch let error as NSError {
            print("Error saving student data: \(error.localizedDescription)")
            // Present a more informative error message to the user if needed
            showAlert(message: "Failed to save student data. Please try again.")
        }
    }

    
    // Helper method to show an alert with a given message
        private func showAlert(message: String) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    

    @IBAction func btnLogin(_ sender: Any) {
        self.moveToLoginVC()
    }
    
  

}
