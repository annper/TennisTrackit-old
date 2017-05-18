//
//  GoalsInterfaces.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

/** view **/

protocol GoalsViewOutput: class {
    func viewWillAppear(animated: Bool)
    func openMenu()
    func openGoalDetailWith(displayItem: GoalsListDisplayItem?)
}

protocol GoalsViewInput: class, SectionItemViewInput {
    
}

/** interactor **/

protocol GoalsInteractorInput: class {
    func dataItems() -> [GoalsListDataItem]
    func goalWith(id: String) -> Goal?
}

protocol GoalsInteractorOutput: class {
    
}
