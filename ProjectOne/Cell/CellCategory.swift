//
//  CellCategory.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 29/11/2023.
//

import UIKit

class CellCategory: UITableViewCell {
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
