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
    func openMenu()
    func saveGoal()
}

protocol GoalDetailViewInput: class {
    func setupView(goal: GoalDetailDisplayDataItem?)
    func saveItem() -> GoalDetailDisplayDataItem
}

/** interactor **/

protocol GoalDetailInteractorInput: class {
    // GoalDetail interactor inputs
    func save(updatedGoal: GoalDetailDisplayDataItem, originalGoal: GoalDetailDataItem?)
}

protocol GoalDetailInteractorOutput: class {
    // GoalDetail interactor outputs
}
