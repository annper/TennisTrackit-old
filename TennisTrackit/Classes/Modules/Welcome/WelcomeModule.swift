//
//  WelcomeModuleBuilder.swift
//  Generated using vipergen
//
//  Copyright © 2015. All rights reserved.
//

import UIKit

struct WelcomeModule {
	
	static func build() -> UIViewController {
        let module = buildModule()

        return module.viewController
	}
    
    private static func buildModule() -> (viewController: UIViewController, presenter: WelcomePresenter) {
        let viewController = WelcomeViewController(nibName: "WelcomeView", bundle: nil)
        let wireframe = WelcomeWireframe()
        let interactor = WelcomeInteractor()
		let presenter = WelcomePresenter(wireframe: wireframe, interactor: interactor, userInterface: viewController)
        
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
