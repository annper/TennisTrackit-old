//
//  GoalDataManager.swift
//  TennisTrackit
//
//  Created by Annie on 15/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation
import RealmSwift

public class GoalDataManager: BaseDataManager {
    
    internal func managedGoalWith(goal: Goal) -> ManagedGoal {
        
        let managedGoal = ManagedGoal()
        
        managedGoal.title = goal.title
        managedGoal.desc = goal.desc
        managedGoal.tags = goal.tags
        managedGoal.done = goal.done
        
        if let subtasks = goal.subtasks {
            for subtask in subtasks {
                let managedSubtask = ManagedSubtask.withSubtask(subtask: subtask)
                managedGoal.subtasks.append(managedSubtask)
            }
        }
        
        return managedGoal
    }
    
    internal func goalWithManagedGoal(managedGoal: ManagedGoal) -> Goal {
        
        let goal = Goal()
        
        goal.title = managedGoal.title
        goal.desc = managedGoal.desc
        goal.tags = managedGoal.tags
        goal.done = managedGoal.done
        
        goal.subtasks = [Subtask]()
        
        for managedSubtask in managedGoal.subtasks {
            let subtask = Subtask.withManagedSubtask(managedSubtask: managedSubtask)
            goal.subtasks?.append(subtask)
        }
        
        return goal
    }
}
