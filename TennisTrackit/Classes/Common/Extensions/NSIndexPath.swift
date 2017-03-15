//
//  NSIndexPath.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation

public func == (leftSide: NSIndexPath, rightSide: NSIndexPath) -> Bool {
    
    return leftSide.section == rightSide.section && leftSide.row == rightSide.row
}
