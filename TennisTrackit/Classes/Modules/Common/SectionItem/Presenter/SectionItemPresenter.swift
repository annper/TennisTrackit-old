//
//  SectionItemPresenter.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation

class SectionItemPresenter<T: SectionItem> {
    
    // MARK: - SectionItemPresenter
    
    func displayDataItems() -> [T]? {
        return nil
    }
    
    func sectionItemDisplayDataCollectionWithDisplayDataItems(displayDataItems: [T]?) -> SectionItemDisplayDataCollection {
        
        let sectionItemDisplayDataCollection = SectionItemDisplayDataCollection()
        
        if let items = displayDataItems {
            _ = sectionItemDisplayDataCollection.addItems(items: items.map { $0 as T }, section: 0)
            
            return sectionItemDisplayDataCollection
        }
        
        return sectionItemDisplayDataCollection
    }
    
    func updateSectionItemUserInterface(userInterface: SectionItemViewInput, reloadData: Bool) {
        
        let collection = sectionItemDisplayDataCollectionWithDisplayDataItems(displayDataItems: displayDataItems())
        
        updateSectionItemUserInterface(userInterface: userInterface, collection: collection, reloadData:  reloadData)
    }
    
    func updateSectionItemUserInterface(userInterface: SectionItemViewInput, collection: SectionItemDisplayDataCollection, reloadData: Bool) {
        
        userInterface.updateWithSectionItemDisplayDataCollection(collection: collection, reloadData: reloadData)
        userInterface.showEmpty(empty: collection.isEmpty())
    }
    
    func updateSectionItemUserInterface(userInterface: SectionItemViewInput, byAppendingDisplayDataItems displayDataItems: [T]?) {
        
        if let items = displayDataItems {
            userInterface.updateSectionItemDisplayDataCollectionByAppendingItems(displayDataItems: items.map { $0 as T })
        }
    }
}
