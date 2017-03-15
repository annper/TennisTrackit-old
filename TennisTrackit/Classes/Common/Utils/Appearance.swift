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
        //let navigationFont = Font.regularFontWithSketchSize(Font.size20)
        //let navigationColor = Color.homeRedColor()
        
        //navigationController.navigationBar.titleTextAttributes = [ NSFontAttributeName: navigationFont, NSForegroundColorAttributeName: navigationColor]
        //navigationController.navigationBar.tintColor = navigationColor
        //navigationController.navigationBar.barTintColor = Color.whiteColor()
        
        return navigationController
    }
    
    static func setup() {
        //UIWindow.appearance().tintColor = Color.defaultTintColor()
    }
}
