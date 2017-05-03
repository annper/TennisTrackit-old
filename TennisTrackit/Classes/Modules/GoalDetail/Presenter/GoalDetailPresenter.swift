//
//  GoalDetailPresenter.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalDetailPresenter: GoalDetailViewOutput, GoalDetailInteractorOutput {
    
    var wireframe: GoalDetailWireframe
    var interactor: GoalDetailInteractorInput
    weak var userInterface: GoalDetailViewInput!
    
    var goalDetailDataItem: GoalDetailDataItem!
	
    // MARK: - GoalDetailPresenter
    
    init(wireframe: GoalDetailWireframe, interactor: GoalDetailInteractorInput, userInterface: GoalDetailViewInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.userInterface = userInterface
    }
    
    // MARK: - GoalDetailViewOutput

    func viewDidLoad() {
        userInterface.setupView(goal: goalDetailDataItem)
    }
    
    func viewWillAppear(animated: Bool) {

    }
    
    func openMenu() {
        wireframe.pushMenu()
    }
	
}
