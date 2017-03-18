//
//  HomeInteractor.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//
import UIKit

class HomeInteractor: HomeInteractorInput {
    
    weak var presenter: HomeInteractorOutput!
    
    // MARK: - HomeInteractorInput
    
    func dataItems() -> [HomeListDataItem] {
        var items = [HomeListDataItem]()
        var id = 0
        
        items.append(HomeListDataItem(id: id, text: "Calendar", backgroundColor: Color.homeYellow(), image: nil))
        
        id += 1
        items.append(HomeListDataItem(id: id, text: "My goals", backgroundColor: Color.homeOlive(), image: nil))
        
        id += 1
        items.append(HomeListDataItem(id: id, text: "My skills", backgroundColor: Color.homeDarkOlive(), image: nil))
        
        return items
    }
}
