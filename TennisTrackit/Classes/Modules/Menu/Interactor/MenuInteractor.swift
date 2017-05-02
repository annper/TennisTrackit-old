//
//  MenuInteractor.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//
import UIKit

class MenuInteractor: MenuInteractorInput {
    
    weak var presenter: MenuInteractorOutput!
    
    // MARK: - MenuInteractorInput
    
    func dataItems() -> [MenuListDataItem] {
        var items = [MenuListDataItem]()
        var id = 0
        
        items.append(MenuListDataItem(id: id, text: "Home", icon: UIImage(named: "") ))
        
        id += 1
        items.append(MenuListDataItem(id: id, text: "Goals", icon: UIImage(named: "") ))
        
        id += 1
        items.append(MenuListDataItem(id: id, text: "Skills", icon: UIImage(named: "") ))
        
        id += 1
        items.append(MenuListDataItem(id: id, text: "Drills", icon: UIImage(named: "") ))
        
        id += 1
        items.append(MenuListDataItem(id: id, text: "Journal", icon: UIImage(named: "") ))
        
        id += 1
        items.append(MenuListDataItem(id: id, text: "Calendar", icon: UIImage(named: "") ))
        
        id += 1
        items.append(MenuListDataItem(id: id, text: "About", icon: UIImage(named: "") ))
        
        
        return items
    }
}
