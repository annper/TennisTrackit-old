//
//  MenuWireframe.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class MenuWireframe: Wireframe {

    weak var presenter: MenuPresenter!
    
    // MARK: - MenuWireframe
    
    func showHomeModule() {
         _ = viewController.navigationController?.popToRootViewController(animated: true)
    }
    
    func showGoalsModule() {
        if let viewControllers = viewController.navigationController?.viewControllers {
            if viewControllers.count >= 2 {
                let previousViewController = viewControllers[viewControllers.count - 2]
                if previousViewController.isKind(of: GoalsViewController.self) {
                   _ = viewController.navigationController?.popViewController(animated: true)
                    return
                }
            }
        }

        let goalsViewController = GoalsModule.build()
        pushViewInNavigationController(viewController: goalsViewController, animated: true)

    }
}
