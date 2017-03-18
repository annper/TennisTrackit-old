//
//  Appearance.swift
//  App
//
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

struct Appearance {
    
    // MARK: - Appearance
    
    static func initNavigationController() -> UINavigationController {
        
        let navigationController = UINavigationController()
        let navigationFont = Font.regularTennisFontWithSketchSize(size: Font.size20)
        let navigationTitleColor = Color.navigationGreen()
        let navigationBackgroundColor = Color.navigationYellow()
        
        navigationController.navigationBar.titleTextAttributes = [ NSFontAttributeName: navigationFont, NSForegroundColorAttributeName: navigationTitleColor]
        navigationController.navigationBar.tintColor = navigationTitleColor
        navigationController.navigationBar.barTintColor = navigationBackgroundColor
        
        return navigationController
    }
    
    static func setup() {
        UIWindow.appearance().tintColor = UIColor.white
    }
}
