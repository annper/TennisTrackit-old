//
//  Array.swift
//  App
//
//  Copyright © 2017. All rights reserved.
//

import Foundation

public extension Array {
    
    public subscript (safe index: Int) -> Element? {
        
        return self.indices ~= index ? self[index] : nil
    }
    
    public func slicesOfSize(sliceSize: Int) -> [ArraySlice<Element>] {
        
        var slices: [ArraySlice<Element>] = []
        let steps = Int(ceil(Double(count) / Double(sliceSize)))
        
        // step through each 'slice'
        for step in 0 ..< steps {
            // work out the bounds of the 'slice
            let max = Swift.min(sliceSize, count - (step * sliceSize))
            let from = (step * sliceSize)
            let to = (from + max)
            
            let slice = self[from..<to]
            
            slices.append(slice)
        }
        
        return slices
    }
}
