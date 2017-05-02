//
//  GoalsInteractor.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

class GoalsInteractor: GoalsInteractorInput {
    
    weak var presenter: GoalsInteractorOutput!
    
    // MARK: - GoalsInteractorInput
    
    func dataItems() -> [GoalsListDataItem] {
        var items = [GoalsListDataItem]()
        
        for i in 0...15 {
            let text = "Lorem Ipsum"
            
            let item = GoalsListDataItem(id: i, text: text)
            items.append(item)
        }
        
        return items
    }
}
