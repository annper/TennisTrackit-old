//
//  HomeInteractor.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

class HomeInteractor: HomeInteractorInput {
    
    weak var presenter: HomeInteractorOutput!
    
    // MARK: - HomeInteractorInput
    
    func dataItems() -> [HomeListDataItem] {
        var items = [HomeListDataItem]()
        
        for i in 0...15 {
            let text = "Lorem Ipsum"
            
            let item = HomeListDataItem(id: i, text: text)
            items.append(item)
        }
        
        return items
    }
}
