//
//  EditProductVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 22/12/2023.
//

import UIKit

class EditProductVC: BaseVC {
    @IBOutlet weak var txtUnit: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtImage: UITextField!
    @IBOutlet weak var txtName: UITextField!
    var product: Product?
    var productRepo = ProductRepo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let product = product else { return }
        self.txtName.text = product.name
        self.txtImage.text = product.image
        self.txtPrice.text = product.price
        self.txtUnit.text = product.unit

    }
    
    @IBAction func btnSignoutAction(_ sender: Any) {
        self.moveToLoginVC()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnUpdateAction(_ sender: Any) {
        let name = self.txtName.text ?? ""
        let image = self.txtImage.text ?? ""
        let price = self.txtPrice.text ?? "0"
        let unit = self.txtUnit.text ?? "KG"
        let updatedProduct = Product(name: name, image: image, price: price, unit: unit, categoryId: self.product?.categoryId ?? "", productId: self.product?.productId ?? "")
        productRepo.updateProduct(product: updatedProduct)
        self.navigationController?.popViewController(animated: false)
    }
}
