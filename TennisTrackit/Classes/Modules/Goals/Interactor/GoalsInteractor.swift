//
//  GoalsInteractor.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//
import Foundation

class GoalsInteractor: GoalsInteractorInput {
    
    weak var presenter: GoalsInteractorOutput!
    
    // MARK: - GoalsInteractor
    
    // MARK: - GoalsInteractorInput
    
    func dataItems() -> [GoalsListDataItem] {
        var items = [GoalsListDataItem]()
        var id = 0
        
        // Always add this first cell to include the 'add new' button
        items.append(GoalsListDataItem(id: id, title: "Add new button", description: "Press to add new goal"))
        
        guard let goals = Constants.sharedInstance.UserGoals else {
            return items
        }
        
        for goal in goals {
            id += 1
            items.append(GoalsListDataItem(id: id, title: goal["title"] as! String, description: goal["description"] as? String))
        }
        
        return items
    }
    
}
