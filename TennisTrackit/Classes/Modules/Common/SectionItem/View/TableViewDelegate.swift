//
//  TableViewDelegate.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation
import UIKit

class TableViewDelegate<T: SectionItem>: NSObject, UITableViewDelegate {
    
    var didSelectRowAtIndexPath: ((_ indexPath: NSIndexPath, _ object: T) -> Void)?
    var approachingLastCell: (() -> Void)?
    
    // MARK: - TableViewDelegate
    
    override init() {
    
        super.init()
    }
    
    private func displayDataCollectionWithTableView(tableView: UITableView) -> SectionItemDisplayDataCollection {
        
        let dataSource = tableView.dataSource as! TableViewDataSource<T>
        
        return dataSource.data
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let closure = didSelectRowAtIndexPath {
            let data = displayDataCollectionWithTableView(tableView: tableView)
            let object = data.sectionItems[indexPath.section][indexPath.row]
            
            closure(indexPath as NSIndexPath, object as! T)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let closure = approachingLastCell {
            
            if indexPath == tableView.lastIndexPath() {
                closure()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
}
