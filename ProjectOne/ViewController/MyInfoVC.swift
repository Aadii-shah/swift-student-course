//
//  MyInfoVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 28/07/2023.
//

import UIKit

class MyInfoVC: BaseVC {
    @IBOutlet weak var lblUserName: UILabel!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("UserName: \(self.user?.userName ?? "")")
        print("Password: \(self.user?.password ?? "")")
        
        self.lblUserName.text = self.user?.userName ?? ""

    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.moveToLoginVC()
    }
}
