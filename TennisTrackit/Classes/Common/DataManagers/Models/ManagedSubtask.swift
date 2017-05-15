//
//  ManagedSubtask.swift
//  TennisTrackit
//
//  Created by Annie on 15/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation

public class ManagedSubtask: ManagedBaseModel {
    public dynamic var title: String = ""
    public dynamic var done: Bool = false
    
    // MARK: TicketState
    
    static func withSubtask(subtask: Subtask) -> ManagedSubtask {
        
        let managedSubtask = ManagedSubtask()
        
        managedSubtask.title = subtask.title
        managedSubtask.done = subtask.done
        
        return managedSubtask
    }
    
}
