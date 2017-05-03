//
//  GoalDetailWireframe.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalDetailWireframe: Wireframe {

    weak var presenter: GoalDetailPresenter!
    
    // MARK: - GoalDetailWireframe
    
    func pushMenu() {
        let menuViewController = MenuModule.build()
        pushViewInNavigationController(viewController: menuViewController, animated: true)
    }
    
}
