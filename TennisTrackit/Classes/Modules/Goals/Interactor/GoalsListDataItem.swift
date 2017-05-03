//
//  GoalsListDataItem.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

struct GoalsListDataItem {
	
    var id: Int
    var title: String
    var description: String?
    
    init(id: Int, title: String, description: String?) {
        self.id = id
        self.title = title
        self.description = description
    }
}
