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
        items.append(GoalsListDataItem(id: id, title: "Add new", description: nil, done: false))
        
        guard let goals = Constants.sharedInstance.UserGoals as? [GoalDetailDataItem] else {
            return items
        }
        
        for goal in goals {
            items.append(GoalsListDataItem(id: id, title: goal.title, description: goal.description, done: goal.done))
            id += 1
        }
        
        return items
    }
    
    func goalItemWith(display: GoalsListDisplayItem) -> GoalDetailDataItem? {
        
        guard let goals = Constants.sharedInstance.UserGoals as? [GoalDetailDataItem] else {
            return nil
        }
        
        let goal = goals[display.id]
        
        return GoalDetailDataItem(id: goal.id, title: goal.title, description: goal.description, done: goal.done, subtasks: goal.subtasks, tags: goal.tags)
        
    }
    
}
