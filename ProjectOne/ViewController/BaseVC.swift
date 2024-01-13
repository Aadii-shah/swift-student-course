//
//  BaseVC.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 03/08/2023.
//

import UIKit

class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func moveToEditProductVC(product: Product?) {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is EditProductVC {
                    let editProductVC = aVC as! EditProductVC
                    editProductVC.product = product
                    self.navigationController?.popToViewController(editProductVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .EditProductVC, storyboardName: .Main) as! EditProductVC
        vc.product = product
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToAddProductVC(category: Category?) {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is AddProductVC {
                    let addProductVC = aVC as! AddProductVC
                    addProductVC.category = category
                    self.navigationController?.popToViewController(addProductVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .AddProductVC, storyboardName: .Main) as! AddProductVC
        vc.category = category
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToProductListVC(category: Category) {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is ProductListVC {
                    let productListVC = aVC as! ProductListVC
                    productListVC.category = category
                    self.navigationController?.popToViewController(productListVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .ProductListVC, storyboardName: .Main) as! ProductListVC
        vc.category = category
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToAddCategoryVC() {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is AddCategoryVC {
                    self.navigationController?.popToViewController(aVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .AddCategoryVC, storyboardName: .Main) as! AddCategoryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToMyInfoScreen(user: User) {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is MyInfoVC {
                    self.navigationController?.popToViewController(aVC, animated: false)
                    return
                }
            }
        }
        
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .MyInfoVC, storyboardName: .Main) as! MyInfoVC
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToLoginVC() {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is LoginVC {
                    self.navigationController?.popToViewController(aVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .LoginVC, storyboardName: .Main) as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func moveToTabBarController() {
        let storybaord = UIStoryboard(name: StoryboardNames.Main.rawValue, bundle: nil)
        let tabBarController = storybaord.instantiateViewController(withIdentifier: VCNames.TabBarController.rawValue) as! TabBarController
        self.navigationController?.pushViewController(tabBarController, animated: false)
    }
    
    
    func moveToRegisterVC() {
        let viewControllers = self.navigationController?.viewControllers
        if let viewControllers = viewControllers {
            for aVC in viewControllers {
                if aVC is RegisterVC {
                    self.navigationController?.popToViewController(aVC, animated: false)
                    return
                }
            }
        }
        let vc = NavigationHandler.initiateViewControllerWith(identifier: .RegisterVC, storyboardName: .Main) as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
