//
//  GoalsModuleBuilder.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit
//import AppCommon

struct GoalsModule {

	static func build() -> UIViewController {
        let module = buildModule()

        return module.viewController
	}
    
    private static func buildModule() -> (viewController: GoalsViewController, presenter: GoalsPresenter) {
        let viewController = GoalsViewController(nibName: nil, bundle: nil)
        let wireframe = GoalsWireframe()
        let interactor = GoalsInteractor()
		let presenter = GoalsPresenter(wireframe: wireframe, interactor: interactor, userInterface: viewController)
        
        wireframe.presenter = presenter
        wireframe.viewController = viewController
        
        presenter.interactor = interactor
        presenter.userInterface = viewController
        presenter.wireframe = wireframe
        
        interactor.presenter = presenter
        interactor.goalDataManager = GoalDataManager()
        
        viewController.eventHandler = presenter
        
		return (viewController: viewController, presenter: presenter)
    }
    
}
