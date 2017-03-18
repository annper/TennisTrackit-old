//
//  MenuInteractor.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

class MenuInteractor: MenuInteractorInput {
    
    weak var presenter: MenuInteractorOutput!
    
    // MARK: - MenuInteractorInput
    
    func dataItems() -> [MenuListDataItem] {
        var items = [MenuListDataItem]()
        
        for i in 0...15 {
            let text = "Lorem Ipsum"
            
            let item = MenuListDataItem(id: i, text: text)
            items.append(item)
        }
        
        return items
    }
}
