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
    
    var goalDetailDataItem: GoalDetailDataItem!
	
    // MARK: - GoalDetailPresenter
    
    init(wireframe: GoalDetailWireframe, interactor: GoalDetailInteractorInput, userInterface: GoalDetailViewInput) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.userInterface = userInterface
    }
    
    private func goalDisplayItemWith(goalDetailItem: GoalDetailDataItem?) -> GoalDetailDisplayDataItem? {
        
        guard let goal = goalDetailItem else {
            return nil
        }
        
        var tagsString: String?
        
        if let tags = goal.tags, tags.count > 0 {
            tagsString = "#" + tags.joined(separator: " #")
        }
        
        return GoalDetailDisplayDataItem(title: goal.title, description: goal.description, done: goal.done, tags: tagsString)
    }
    
    // MARK: - GoalDetailViewOutput

    func viewDidLoad() {
        let goalDisplayItem = goalDisplayItemWith(goalDetailItem: goalDetailDataItem)
        userInterface.setupView(goal: goalDisplayItem)
    }
    
    func openMenu() {
        wireframe.pushMenu()
    }
    
    func saveGoal() {
        let updates = userInterface.saveItem()
        interactor.save(updatedGoal: updates, originalGoal: goalDetailDataItem)
    }
	
}
