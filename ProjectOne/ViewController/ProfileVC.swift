//
//  ProfileVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 10/08/2023.
//

import UIKit

class ProfileVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSignOutAction(_ sender: Any) {
        self.moveToLoginVC()
    }
}
