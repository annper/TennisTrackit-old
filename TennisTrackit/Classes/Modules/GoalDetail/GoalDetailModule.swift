//
//  GoalDetailModuleBuilder.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

struct GoalDetailModule {
	
    static func buildWith(goal: Goal?) -> UIViewController {
        let module = buildModule()

        module.presenter.goal = goal
        
        return module.viewController
	}
    
    private static func buildModule() -> (viewController: GoalDetailViewController, presenter: GoalDetailPresenter) {
        let viewController = GoalDetailViewController(nibName: "GoalDetailView", bundle: nil)
        let wireframe = GoalDetailWireframe()
        let interactor = GoalDetailInteractor()
		let presenter = GoalDetailPresenter(wireframe: wireframe, interactor: interactor, userInterface: viewController)
        
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
