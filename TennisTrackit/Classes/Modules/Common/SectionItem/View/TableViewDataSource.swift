//
//  TableViewDataSource.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<T: SectionItem>: NSObject, UITableViewDataSource {
    
    var data = SectionItemDisplayDataCollection()
    var setupCellWithObject: ((_ cell: UITableViewCell, _ object: T) -> Void)?
    var setupCellWithObjectForIndexPath: ((_ cell: UITableViewCell, _ object: T, _ indexPath: NSIndexPath) -> Void)?
    private var reuseIdentifier: String?
    
    // MARK: - TableViewDataSource
    
    internal func objectWithCell(cell: UITableViewCell?, indexPath: NSIndexPath) -> T {
        
        let objects = data.sectionItems[indexPath.section]
        let object = objects[indexPath.row]
        
        return object as! T
    }
    
    // MARK: - UITableViewDataSource
    
    override init() {
        
        super.init()
    }
    
    convenience init(reuseIdentifier: String) {
        
        self.init()
        
        self.reuseIdentifier = reuseIdentifier
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return data.sectionItems.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let objects = data.sectionItems[safe: section] {
            return objects.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!, for: indexPath)
        
        // callback to setup cell
        if let closure = setupCellWithObject {
            let object = objectWithCell(cell: cell, indexPath: indexPath as NSIndexPath)
            
            closure(cell, object)
        } else if let closure = setupCellWithObjectForIndexPath {
            let object = objectWithCell(cell: cell, indexPath: indexPath as NSIndexPath)
            
            closure(cell, object, indexPath as NSIndexPath)
        }
        
        return cell
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        
        if 0 < data.sectionIndexTitles.count {
            return data.sectionIndexTitles
        }
        
        return nil
    }
}
