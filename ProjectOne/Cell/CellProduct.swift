//
//  CellProduct.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 22/12/2023.
//

import UIKit

protocol CellProductDelegate {
    func editProduct(product: Product?)
    func deleteProduct(product: Product?)
}


class CellProduct: UITableViewCell {
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblUnit: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var productListDelegate: CellProductDelegate?
    
    var product: Product?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadProduct(product: Product?) {
        self.product = product
        self.lblName.text = product?.name ?? ""
        self.lblPrice.text = product?.price ?? ""
        self.lblUnit.text = product?.unit ?? ""
    }
    
    @IBAction func btnEditAction(_ sender: Any) {
        self.productListDelegate?.editProduct(product: self.product)
    }
    
    @IBAction func btnDeleteAction(_ sender: Any) {
        self.productListDelegate?.deleteProduct(product: self.product)
    }
    
}
