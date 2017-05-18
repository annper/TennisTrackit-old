//
//  GoalsWireframe.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsWireframe: Wireframe {

    weak var presenter: GoalsPresenter!
    
    // MARK: - GoalsWireframe
    
    func pushMenu() {
        let menuViewController = MenuModule.build()
        pushViewInNavigationController(viewController: menuViewController, animated: true)
    }
    
    func pushNewGoalWith(goal: Goal?) {
        let goalDetailViewController = GoalDetailModule.buildWith(goal: goal)
        pushViewInNavigationController(viewController: goalDetailViewController, animated: true)
    }

}
