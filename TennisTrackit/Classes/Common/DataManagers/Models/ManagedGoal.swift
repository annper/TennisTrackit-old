//
//  ManagedGoal.swift
//  TennisTrackit
//
//  Created by Annie on 15/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation
import RealmSwift

public class ManagedGoal: ManagedBaseModel {
    public dynamic var title: String = ""
    public dynamic var desc: String?
    public var subtasks = List<ManagedSubtask>()
    public dynamic var tags: String?
    public dynamic var done: Bool = false
    
    // MARK: TicketState
    
    static func withGoal(goal: Goal) -> ManagedGoal {
        
        let managedGoal = ManagedGoal()
        
        managedGoal.title = goal.title
        managedGoal.desc = goal.desc
        managedGoal.tags = goal.tags
        managedGoal.done = goal.done
        
        return managedGoal
    }
    
}
