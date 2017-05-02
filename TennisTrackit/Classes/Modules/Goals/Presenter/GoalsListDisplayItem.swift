//
//  GoalsListDisplayItem.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsListDisplayItem: SectionItem {
    
    var id: Int
    var text: String
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
    
    // MARK: - SectionItem
    
    var identifier: String { get { return String(id) } }
}
