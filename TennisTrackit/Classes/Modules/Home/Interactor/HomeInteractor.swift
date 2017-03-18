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
        var id = 0
        
        items.append(HomeListDataItem(id: id, text: "Comin up..."))
        
        id += 1
        items.append(HomeListDataItem(id: id, text: "My goals"))
        
        id += 1
        items.append(HomeListDataItem(id: id, text: "View calendar"))
        
        return items
    }
}
