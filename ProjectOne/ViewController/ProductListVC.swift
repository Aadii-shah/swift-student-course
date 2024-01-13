//
//  ProductListVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 06/12/2023.
//

import UIKit

class ProductListVC: BaseVC {
    @IBOutlet weak var tblProduct: UITableView!
    @IBOutlet weak var lblHeader: UILabel!

    var category: Category? = nil
    var productRepo = ProductRepo()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblHeader.text = self.category?.name
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tblProduct.reloadData()
    }
    
    @IBAction func btnSignOutAction(_ sender: Any) {
        self.moveToLoginVC()
    }
    
    @IBAction func btnAddAction(_ sender: Any) {
        self.moveToAddProductVC(category: self.category)
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You have selected!")
    }
}

extension ProductListVC: CellProductDelegate {
    func deleteProduct(product: Product?) {
        guard let product = product else {return}
        productRepo.deleteProduct(by: product.productId)
        self.tblProduct.reloadData()
    }
    
    func editProduct(product: Product?) {
        print("Edit \(product?.name ?? "")")
        self.moveToEditProductVC(product: product)
    }
}

extension ProductListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productRepo.getProducts(for: self.category?.categoryId ?? "NA").count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellProduct = tblProduct.dequeueReusableCell(withIdentifier: "cellProduct")! as! CellProduct
        
        cell.productListDelegate = self
        
        let product: Product? = productRepo.getProducts(for: self.category?.categoryId ?? "NA")[indexPath.row]
        cell.loadProduct(product: product)
        return cell
    }
    
}
