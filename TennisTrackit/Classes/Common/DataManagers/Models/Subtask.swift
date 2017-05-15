//
//  Subtask.swift
//  TennisTrackit
//
//  Created by Annie on 15/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation

public class Subtask {
    
    public var title: String = ""
    public var done: Bool = false
    
    static func withManagedSubtask(managedSubtask: ManagedSubtask) -> Subtask {
        
        let subtask = Subtask()
        
        subtask.title = managedSubtask.title
        subtask.done = managedSubtask.done
        
        return subtask
    }
}
