//
//  UIViewController.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation
import UIKit
import Cartography

extension UIViewController {

    // MARK: - UIViewController
    
    func addAndInformChildViewController(childViewController: UIViewController, toView view:UIView, topInset: CGFloat = 0) {
        
        childViewController.willMove(toParentViewController: self)
        
        self.addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        
        constrain(childViewController.view, view) { childViewControllerView, view in
            childViewControllerView.leading == view.leading
            childViewControllerView.trailing == view.trailing
            childViewControllerView.top == view.top + topInset
            childViewControllerView.bottom == view.bottom
        }
        
        childViewController.didMove(toParentViewController: self)
    }
    
    func canPushWith(classString: String) -> Bool {
        
        var push = true
        
        if let viewcontrollers = navigationController?.viewControllers {
            
            for controller in viewcontrollers {
                if controller != self {
                    if classString == type(of: controller).className() {
                        push = false
                    }
                }
            }
        }
        
        return push
    }
}
