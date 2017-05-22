//
//  GoalsInterfaces.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import Foundation

/** view **/

protocol GoalsViewOutput: class {
    func viewWillAppear(animated: Bool)
    func openMenu()
    func openGoalDetailWith(displayItem: GoalsListDisplayItem?)
    func deleteRowAt(indexPath: IndexPath)
}

protocol GoalsViewInput: class, SectionItemViewInput {
    func delteTableRow()
}

/** interactor **/

protocol GoalsInteractorInput: class {
    func dataItems() -> [GoalsListDataItem]
    func goalWith(id: String) -> Goal?
    func deleteGoalAt(index: Int)
}

protocol GoalsInteractorOutput: class {
    
}
