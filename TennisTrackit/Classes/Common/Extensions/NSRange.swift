//
//  NSRange.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation

extension NSRange {
    
    var end: Int {
        get {
            return location + length
        }
    }
}
