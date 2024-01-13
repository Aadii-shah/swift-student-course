//
//  AddCategoryVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 30/11/2023.
//

import UIKit

class AddCategoryVC: BaseVC {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtImage: UITextField!
    
    var categoryRepo = CategoryRepo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSignOutAction(_ sender: Any) {
        self.moveToLoginVC()
    }
    
    @IBAction func btnAddCategory(_ sender: Any) {
        self.categoryRepo.createCategory(name: self.txtName.text ?? "NA", imageName: self.txtImage.text  ?? "NA")
        self.navigationController?.popViewController(animated: true)
    }
    
}
