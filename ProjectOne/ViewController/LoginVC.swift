//
//  LoginVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 28/07/2023.
//

import UIKit

class LoginVC: BaseVC {
   
    
    @IBAction func sc(_ sender: UISegmentedControl) {
     
        
    }
    
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnRegister(_ sender: Any) {
        self.moveToRegisterVC()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //logoImageView.image = UIImage(named: "admin")
        print("You are inside ViewController")
      
        self.txtUserName.text = "chandra"
        self.txtPassword.text = "chandra"
    }
    
    
    @IBAction func btnLoginAction(_ sender: Any) {
        
      

                switch selectedSegmentIndex {
                case 0:
                    loginAdmin()
                case 1:
                    loginStudent()
                default:
                    break
                }
        
        
        
//        let user = User(userName: self.txtUserName.text ?? "", password: self.txtPassword.text ?? "")
//        if user.isValidUser() {
//            self.moveToTabBarController()
//        } else {
//            let alert = UIAlertController(title: "Message", message: "Invalid Username or Passoword!", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true)
//        }
        
        

    }
    
    func loginAdmin() {}
    
    func loginStudent(){}
    
    
}

