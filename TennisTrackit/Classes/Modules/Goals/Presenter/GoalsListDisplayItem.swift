//
//  GoalsListDisplayItem.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsListDisplayItem: SectionItem {
    
    var id: String
    var title: String
    var description: String?
    
    init(id: String, title: String, description: String?) {
        self.id = id
        self.title = title
        self.description = description
    }
    
    // MARK: - SectionItem
    
    var identifier: String { get { return String(id) } }
}
