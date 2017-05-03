//
//  GoalsPresenter.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsPresenter: SectionItemPresenter<GoalsListDisplayItem>, GoalsViewOutput, GoalsInteractorOutput {
    
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
    
    func viewWillAppear(animated: Bool) {
        updateSectionItemUserInterface(userInterface: userInterface, reloadData: false)
    }
    
    func openMenu() {
        wireframe.pushMenu()
    }
    
    func openGoalDetailWith(item: Any?) {
        wireframe.pushNewGoalWith(item: item)
    }
    
    // MARK: - SectionItemPresenter
    
    override func displayDataItems() -> [GoalsListDisplayItem]? {
        let dataItems = interactor.dataItems()
        
        return dataItems.map { GoalsListDisplayItem(id: $0.id, title: $0.title, description: $0.description) }
    }

}
