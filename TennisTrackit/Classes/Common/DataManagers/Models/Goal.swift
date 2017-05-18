//
//  Goal.swift
//  TennisTrackit
//
//  Created by Annie on 15/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation

public class Goal {
    
    public var id: String = ""
    public var title: String = ""
    public var desc: String?
    public var subtasks: [Subtask]?
    public var tags: String?
    public var done: Bool = false
    
    static func withManagedGoal(managedGoal: ManagedGoal) -> Goal {
        
        let goal = Goal()
        
        goal.id = managedGoal.id
        goal.title = managedGoal.title
        goal.desc = managedGoal.desc
        goal.tags = managedGoal.tags
        goal.done = managedGoal.done
        
        return goal
    }
    
    func subtaskWith(id: Int) -> Subtask? {
        
        guard let subtasks = self.subtasks else {
            return nil
        }
        
        return subtasks.filter { $0.id == id }.first!
    }
}
