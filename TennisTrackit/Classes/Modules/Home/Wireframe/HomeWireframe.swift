//
//  HomeWireframe.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class HomeWireframe: Wireframe {

    weak var presenter: HomePresenter!
    
    // MARK: - HomeWireframe
    
    func presentCalendarModule() {
        print("present clandar")
    }
    
    func presentGoalsModule() {
        let goalsViewController = GoalsModule.build()
        pushViewInNavigationController(viewController: goalsViewController, animated: true)
    }
    
    func presentSkillsModule() {
        print("present skills")
    }
    
    func presentMenuModule() {
        let menuModule = MenuModule.build()
        pushViewInNavigationController(viewController: menuModule, animated: true)
    }

}
