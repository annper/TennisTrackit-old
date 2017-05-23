//
//  GoalDetailPresenter.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalDetailPresenter: GoalDetailViewOutput, GoalDetailInteractorOutput {
    
    var wireframe: GoalDetailWireframe
    var interactor: GoalDetailInteractorInput
    weak var userInterface: GoalDetailViewInput!
    
    var goal: Goal?
	
    // MARK: - GoalDetailPresenter
    
    init(wireframe: GoalDetailWireframe, interactor: GoalDetailInteractorInput, userInterface: GoalDetailViewInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.userInterface = userInterface
    }
    
    private func goalDisplayItemWith(goal: Goal?) -> GoalDetailDisplayDataItem? {
        
        guard let goal = goal else {
            return nil
        }
        
        return GoalDetailDisplayDataItem(title: goal.title, description: goal.desc, done: goal.done, tags: goal.tags)
    }
    
    func formatTags(tags: String) -> String {
        
        let tagsArray = tags.components(separatedBy: ",")
        let formattedTags = tagsArray.map { tag -> String in
        
            var formattedTag = tag.replacingOccurrences(of: "#", with: "")
            formattedTag = tag.replacingOccurrences(of: ",", with: "")

            formattedTag = formattedTag.trimmingCharacters(in: .whitespacesAndNewlines)
            
            return "#\(formattedTag)"
        }
        let value = formattedTags.joined(separator: ", ")
        return value
        
    }
    
    // MARK: - GoalDetailViewOutput

    func viewDidLoad() {
        let goalDisplayItem = goalDisplayItemWith(goal: goal)
        userInterface.setupView(goal: goalDisplayItem)
    }
    
    func openMenu() {
        wireframe.pushMenu()
    }
    
    func saveGoal() {
        var updates = userInterface.saveItem()
        if let tags = updates.tags, tags.length > 0 {
            
            let formattedTags = formatTags(tags: tags)
            
            if formattedTags != updates.tags {
                updates.tags = formatTags(tags: tags)
                userInterface.setupView(goal: updates)
            }
            
        }
        goal = interactor.save(updatedGoal: updates, originalGoal: goal)
    }
	
}
