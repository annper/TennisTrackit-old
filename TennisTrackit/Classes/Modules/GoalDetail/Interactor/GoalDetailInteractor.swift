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
    
    // MARK: - GoalDetailInteractorInput
    
    func save(updatedGoal: GoalDetailDisplayDataItem, originalGoal: GoalDetailDataItem?) {
        
        // Get the full list of goals
        var goals = [GoalDetailDataItem]()
        
        if let savedGoals = Constants.sharedInstance.UserGoals as? [GoalDetailDataItem] {
            goals = savedGoals
        }
        
        var savedTags: [String]?
        
        // Every goal must have a title
        guard let title = updatedGoal.title else {
            return
        }
        
        if title.length <= 0 {
            return
        }
        
        if let tags = updatedGoal.tags {
            savedTags = tags.replacingOccurrences(of: "#", with: "").components(separatedBy: ",")
        }
        
        // Save it
        let id = nil == originalGoal ? goals.count : originalGoal!.id
        let goalToSave = GoalDetailDataItem(id: id, title: title, description: updatedGoal.description, done: updatedGoal.done, subtasks: nil, tags: savedTags)
        
        if nil == originalGoal {
            goals.append(goalToSave)
        } else {
            goals[id] = goalToSave
        }
        
        let defaults = UserDefaults.standard
        
//        return goals
    }
}
