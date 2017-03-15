//
//  Wireframe.swift
//  App
//
//  Copyright © 2017. All rights reserved.
//

import UIKit

class Wireframe {
    
    var viewController: UIViewController!
    
    internal func pushViewInNavigationController(viewController: UIViewController, animated: Bool) {
        if let navigationController = self.viewController.navigationController {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    internal func presentViewModally(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.viewController.present(viewController, animated: animated, completion: completion)
    }
    
    internal func dismissSelf() {
        
        if let navigationController = viewController.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            viewController.dismiss(animated: true, completion: nil)
        }
    }
}
