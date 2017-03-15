//
//  SectionItemInterfaces.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation

protocol SectionItemViewInput {
    
    func showEmpty(empty: Bool)
    func updateWithSectionItemDisplayDataCollection(collection: SectionItemDisplayDataCollection, reloadData: Bool)
    func updateSectionItemDisplayDataCollectionByAppendingItems(displayDataItems: [SectionItem])
    func reloadDisplayDataItem(displayDataItem: SectionItem)
}
