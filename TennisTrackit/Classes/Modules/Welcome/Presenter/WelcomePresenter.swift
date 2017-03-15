//
//  WelcomePresenter.swift
//  Generated using vipergen
//
//  Copyright © 2017. All rights reserved.
//

import UIKit

class WelcomePresenter: WelcomeViewOutput, WelcomeInteractorOutput {
    
    var wireframe: WelcomeWireframe
    var interactor: WelcomeInteractorInput
    weak var userInterface: WelcomeViewInput!
	
    // MARK: - WelcomePresenter
    
    init(wireframe: WelcomeWireframe, interactor: WelcomeInteractorInput, userInterface: WelcomeViewInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.userInterface = userInterface
    }
    
    // MARK: - WelcomeViewOutput

    func viewDidLoad() {

    }
    
    func viewWillAppear(animated: Bool) {

    }
	
}
