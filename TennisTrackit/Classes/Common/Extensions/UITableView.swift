//
//  UITableView.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func lastIndexPath() -> IndexPath? {
        
        let section = numberOfSections - 1
        
        if 0 > section {
            return nil
        }
        
        let row = numberOfRows(inSection: section) - 1
        
        return IndexPath(row: row, section: section)
    }
}
