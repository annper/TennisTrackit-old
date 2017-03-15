//
//  CollectionViewDelegate.swift
//  App
//
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewDelegate<T: SectionItem>: NSObject,
UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var didSelectItemAtIndexPath: ((_ indexPath: NSIndexPath, _ object: T) -> Void)?
    var loading = false
    var approachingLastCell: (() -> Void)?
    
    // MARK: - CollectionViewDelegate
    
    override init() {
        
        super.init()
    }
    
    private func displayDataCollectionWithCollectionView(collectionView: UICollectionView) -> SectionItemDisplayDataCollection {
        
        let dataSource = collectionView.dataSource as! CollectionViewDataSource<T>
        
        return dataSource.data
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let closure = didSelectItemAtIndexPath {
            let data = displayDataCollectionWithCollectionView(collectionView: collectionView)
            let object = data.sectionItems[indexPath.section][indexPath.row]
            
            closure(indexPath as NSIndexPath, object as! T)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
            
            if let closure = approachingLastCell {
                
                if indexPath == collectionView.lastIndexPath() {
                    closure()
                }
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if loading && section == collectionView.lastIndexPath()!.section {
            return CGSize(width: 80, height: 80)
        }
        
        return CGSize(width: 0, height: 0)
    }
}
