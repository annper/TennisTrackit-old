//
//  GoalDetailInteractor.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import Foundation

class GoalDetailInteractor: GoalDetailInteractorInput {
    
    weak var presenter: GoalDetailInteractorOutput!
    var goalDataManager: GoalDataManager!
    
    // MARK: - GoalDetailInteractorInput
    
    func save(updatedGoal: GoalDetailDisplayDataItem, originalGoal: Goal?) -> Goal? {
        
        // A goal must have a title to save/update
        guard (updatedGoal.title?.length)! > 0 else {
            return nil
        }
        
        let savedGoal = Goal()
        let id: String = nil != originalGoal ? originalGoal!.id : Date().timestamp
        
        // TODO: - Also save subtasks
        
        savedGoal.id = id
        savedGoal.title = updatedGoal.title!
        savedGoal.desc = updatedGoal.description
        savedGoal.subtasks = nil
        savedGoal.tags = updatedGoal.tags
        savedGoal.done = updatedGoal.done
        
        if nil != originalGoal {
            goalDataManager.deleteGoalWith(id: id)
        }
        goalDataManager.persistOrUpdateGoals(goals: [savedGoal] )

        return savedGoal
    }
}
