//
//  CategoryVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 10/08/2023.
//

import UIKit

class CategoryVC: BaseVC {
    @IBOutlet weak var tblCategory: UITableView!
    
    var categoryRepo = CategoryRepo()
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.reloadCategoryVC()
    }
    
    func reloadCategoryVC() {
        self.categories = categoryRepo.getCategories()
        self.tblCategory.reloadData()
    }
    
    @IBAction func btnSignOutAction(_ sender: Any) {
        self.moveToLoginVC()
    }
    
    @IBAction func btnAddAction(_ sender: Any) {
        self.moveToAddCategoryVC()
    }
}

extension CategoryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category: Category = self.categories[indexPath.row]
        self.moveToProductListVC(category: category)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let category: Category = self.categories[indexPath.row]
            categoryRepo.deleteCategory(by: category.categoryId)
//            self.tblCategory.deleteRows(at: [indexPath], with: .automatic)
            self.reloadCategoryVC()
        }
    }
}

extension CategoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellCategory = tblCategory.dequeueReusableCell(withIdentifier: "cellCategory")! as! CellCategory
        let category: Category = self.categories[indexPath.row]
        cell.lblCategoryName?.text = category.name
        return cell
    }
}
