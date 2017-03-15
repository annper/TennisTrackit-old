//
//  CollectionViewDataSource.swift
//  App
//
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewDataSource<T: SectionItem>: NSObject, UICollectionViewDataSource {
    
    var data = SectionItemDisplayDataCollection()
    var setupCellWithObject: ((_ cell: UICollectionViewCell, _ object: T) -> Void)?
    var setupCellWithIndexPath: ((_ cell: UICollectionViewCell, _ object: T, _ indexPath: NSIndexPath) -> Void)?
    private var reuseIdentifier: String?
    
    // MARK: - CollectionViewDataSource
    
    private func objectWithCell(cell: UICollectionViewCell?, indexPath: NSIndexPath) -> T {
        
        let objects = data.sectionItems[indexPath.section]
        let object = objects[indexPath.row]
        
        return object as! T
    }
    
    // MARK: - UICollectionViewDataSource
    
    override init() {
        super.init()
    }
    
    convenience init(reuseIdentifier: String) {
        
        self.init()
        
        self.reuseIdentifier = reuseIdentifier
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return data.sectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let objects = data.sectionItems[safe: section] {
            return objects.count
        }
        
        return 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier!, for: indexPath as IndexPath)
        
        // callback to setup cell
        if let closure = setupCellWithObject {
            let object = objectWithCell(cell: cell, indexPath: indexPath as NSIndexPath)
            
            closure(cell, object)
        } else if let closure = setupCellWithIndexPath {
            let object = objectWithCell(cell: cell, indexPath: indexPath as NSIndexPath)
            
            closure(cell, object, indexPath as NSIndexPath)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        // we can't return nil so assume always loading (zero height in delegate controls appearance)
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter,
                                                               withReuseIdentifier: PagingLoadingView.reuseIdentifier(), for: indexPath as IndexPath)
    }
}

