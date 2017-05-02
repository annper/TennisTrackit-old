//
//  GoalsPresenter.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsPresenter: GoalsViewOutput, GoalsInteractorOutput {
    
    var wireframe: GoalsWireframe
    var interactor: GoalsInteractorInput
    weak var userInterface: GoalsViewInput!
	
    // MARK: - GoalsPresenter
    
    init(wireframe: GoalsWireframe, interactor: GoalsInteractorInput, userInterface: GoalsViewInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.userInterface = userInterface
    }
    
    // MARK: - GoalsViewOutput

    func viewDidLoad() {

    }
    
    func viewWillAppear(animated: Bool) {

    }
	
}
