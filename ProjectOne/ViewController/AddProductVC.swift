//
//  AddProductVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 10/12/2023.
//

import UIKit

class AddProductVC: BaseVC {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUnit: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtImage: UITextField!
    
    var category: Category?
    var productRepo = ProductRepo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSignOutAction(_ sender: Any) {
        self.moveToLoginVC()
    }
    
    @IBAction func btnAddProductAction(_ sender: Any) {
        let name = self.txtName.text ?? ""
        let unit = self.txtUnit.text ?? ""
        let price = self.txtPrice.text ?? ""
        let imageName = self.txtImage.text ?? ""
        
        if name != "" && unit != "" && price != "" && imageName != "" {
            let product = Product(name: name, image: imageName, price: price, unit: unit, categoryId: self.category?.categoryId ?? "NA", productId: UUID().uuidString)
            productRepo.createProduct(product: product)
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Invalid input!")
        }
        
    }
}
