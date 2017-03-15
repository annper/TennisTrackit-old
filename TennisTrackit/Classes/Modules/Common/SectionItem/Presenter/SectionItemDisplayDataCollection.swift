//
//  SectionItemDisplayDataCollection.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation

protocol SectionItem {
    var identifier: String { get }
}

class SectionItemDisplayDataCollection {
    
    var sectionItems: [[SectionItem]] = []
    var sectionIndexTitles: [String] = []
    
    // MARK: - SectionItemDisplayDataCollection
    
    init() {}
    
    func isEmpty() -> Bool {
        
        return sectionItems.count == 0
    }
    
    func lastSection() -> Int {
        
        return sectionItems.count == 0 ? 0 : sectionItems.count - 1
    }
    
    func appendItems(items: [SectionItem]) -> [NSIndexPath] {
        
        return addItems(items: items, section: lastSection())
    }
    
    func addItems(items: [SectionItem], section: Int) -> [NSIndexPath] {
        
        if 0 == items.count {
            return []
        }
        
        if nil == sectionItems[safe: section] {
            sectionItems.insert([], at: section)
        }
        
        var indexPaths: [NSIndexPath] = []
        var existing = sectionItems[section]
        
        for item in items {
            existing.append(item)
            indexPaths.append(NSIndexPath(row: existing.count - 1, section: section))
        }
        
        sectionItems[section] = existing
        
        return indexPaths
    }
    
    func setSectionIndexTitle( indexTitle: String?, forSection section: Int) {
        
        var indexTitle = indexTitle
        if nil == indexTitle {
            indexTitle = ""
        }
        
        sectionIndexTitles.insert(indexTitle!, at: section)
    }
    
    func indexPathForItem(item: SectionItem) -> NSIndexPath? {
        
        var section: Int?
        
        for (index, items) in sectionItems.enumerated() {
            let result = items.filter { $0.identifier == item.identifier }
            
            if 0 != result.count {
                section = index
                break;
            }
        }
        
        if let section = section {
            let row = sectionItems[section].index(where: { $0.identifier == item.identifier })
            
            return NSIndexPath(row: row!, section: section)
        }
        
        return nil
    }
}
