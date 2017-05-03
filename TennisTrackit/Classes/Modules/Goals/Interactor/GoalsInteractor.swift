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
        
        guard let goals = Constants.sharedInstance.UserGoals else {
//            items.append(GoalsListDataItem(id: id, title: "test", description: "test desc"))
            return items
        }
        
        for goal in goals {
            id += 1
            items.append(GoalsListDataItem(id: id, title: goal["title"] as! String, description: goal["description"] as? String))
        }
        
        return items
    }
    
}
