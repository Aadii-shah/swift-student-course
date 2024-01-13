//
//  NavigationHandler.swift
//  ProjectOne
//
//  Created by Chandra Jayaswal on 03/08/2023.
//

import UIKit

final class NavigationHandler {
    
    static func initiateViewControllerWith(identifier: VCNames, storyboardName: StoryboardNames) -> UIViewController {
        let storybaord = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let vc = storybaord.instantiateViewController(withIdentifier: identifier.rawValue)
        return vc
    }
    
}
