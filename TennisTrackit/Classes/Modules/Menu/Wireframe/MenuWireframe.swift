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
        let goalsViewController = GoalsModule.build()
        pushViewInNavigationController(viewController: goalsViewController, animated: true)
    }
    
	/*
	// Example code: how to create and present a module
    func presentHelpModule() {
        let helpModule = HelpModule.build()
        presentViewInNavigationController(helpModule, animated: true)
    }
	*/
}
