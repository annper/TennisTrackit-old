//
//  HomeModuleBuilder.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

import UIKit
//import AppCommon

struct HomeModule {

	static func build() -> UIViewController {
        let module = buildModule()

        return module.viewController
	}
    
    private static func buildModule() -> (viewController: HomeViewController, presenter: HomePresenter) {
        let viewController = HomeViewController(nibName: nil, bundle: nil)
        let wireframe = HomeWireframe()
        let interactor = HomeInteractor()
		let presenter = HomePresenter(wireframe: wireframe, interactor: interactor, userInterface: viewController)
        
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
