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
    
    public func goal(goalId: String) -> Goal? {
        let predicate = NSPredicate(format: "id = %@", goalId)
        
        guard let managedGoal = managedObjectOfType(type: ManagedGoal.self, predicate: predicate)
            else { return nil }
        
        return goalWithManagedGoal(managedGoal: managedGoal as! ManagedGoal)
    }

    public func allGoals() -> [Goal] {
        
        guard let managedGoals = allManagedObjectsOfType(type: ManagedGoal.self)
            else { return [] }
        
        return managedGoals.map { goalWithManagedGoal(managedGoal: $0) }
    }
    
    public func deleteGoalWith(id: String) {
        let predicate = NSPredicate(format: "id = %@", id)
        
        guard let managedGoal: ManagedGoal = managedObjectOfType(type: ManagedGoal.self, predicate: predicate)
            else { return }
        
        managedGoal.subtasks.forEach { (managedSubtask) in
            realmStore!.deleteObject(object: managedSubtask)
        }
        
        realmStore!.deleteObject(object: managedGoal)
    }
    
    public func deleteAllGoals() {
        guard let managedGoals = allManagedObjectsOfType(type: ManagedGoal.self)
            else { return }
        
        managedGoals.forEach({ (managedGoal) in
            realmStore!.deleteObject(object: managedGoal)
        })
        
        if let managedSubtasks = allManagedObjectsOfType(type: ManagedSubtask.self) {
            managedSubtasks.forEach({ (managedSubtask   ) in
                realmStore!.deleteObject(object: managedSubtask)
            })
        }
        
    }
    
    private func goalsWithManagedGoals(managedGoals: [ManagedGoal]) -> [Goal] {
        return managedGoals.map { goalWithManagedGoal(managedGoal: $0) }
    }

    private func managedGoalsWithGoals(goals: [Goal]) -> [ManagedGoal] {
        return goals.map { managedGoalWithGoal(goal: $0) }
    }
    
    internal func managedGoalWithGoal(goal: Goal) -> ManagedGoal {
        
        let managedGoal = ManagedGoal()
        
        managedGoal.id = goal.id
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
        
        goal.id = managedGoal.id
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
    
    public func persistOrUpdateGoals(goals: [Goal]) {
        let managedGoals = managedGoalsWithGoals(goals: goals)
        
        realmStore!.persistOrUpdate(entities: managedGoals)
    }
}
