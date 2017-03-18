//
//  MenuModuleBuilder.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit
//import AppCommon

struct MenuModule {

	static func build() -> UIViewController {
        let module = buildModule()

        return module.viewController
	}
    
    private static func buildModule() -> (viewController: MenuViewController, presenter: MenuPresenter) {
        let viewController = MenuViewController(nibName: nil, bundle: nil)
        let wireframe = MenuWireframe()
        let interactor = MenuInteractor()
		let presenter = MenuPresenter(wireframe: wireframe, interactor: interactor, userInterface: viewController)
        
        wireframe.presenter = presenter
        wireframe.viewController = viewController
        
        presenter.interactor = interactor
        presenter.userInterface = viewController
        presenter.wireframe = wireframe
        
        interactor.presenter = presenter
        
        viewController.eventHandler = presenter
        
		return (viewController: viewController, presenter: presenter)
    }
    
}
