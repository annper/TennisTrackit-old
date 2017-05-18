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
    var goalDataManager: GoalDataManager!
    
    // MARK: - GoalsInteractor
    
    // MARK: - GoalsInteractorInput
    
    func dataItems() -> [GoalsListDataItem] {
        var items = [GoalsListDataItem]()
        
        // Always add this first cell to include the 'add new' button
        items.append(GoalsListDataItem(id: "new", title: "Add new", description: nil, done: false))
        
        let goals = goalDataManager.allGoals()
        
        guard goals.count > 0 else {
            return items
        }
        
        for goal in goals {
            items.append(GoalsListDataItem(id: goal.id, title: goal.title, description: goal.desc, done: goal.done))
        }
        
        return items
    }
    
    func goalWith(id: String) -> Goal? {
    
        guard let goal = goalDataManager.goal(goalId: id) else {
            return nil
        }
        
        return goal
        
    }
    
}
