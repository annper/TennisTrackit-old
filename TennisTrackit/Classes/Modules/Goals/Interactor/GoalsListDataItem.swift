//
//  GoalsListDataItem.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

struct GoalsListDataItem {
	
    var id: String
    var title: String
    var description: String?
    var done: Bool
    
    init(id: String, title: String, description: String?, done: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.done = done
    }
}
