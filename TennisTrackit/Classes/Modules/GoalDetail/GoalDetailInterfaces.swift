//
//  GoalDetailInterfaces.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

/** view **/

protocol GoalDetailViewOutput: class {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func openMenu()
}

protocol GoalDetailViewInput: class {
    func setupView(goal: GoalDetailDisplayDataItem?)
}

/** interactor **/

protocol GoalDetailInteractorInput: class {
    // GoalDetail interactor inputs
}

protocol GoalDetailInteractorOutput: class {
    // GoalDetail interactor outputs
}
