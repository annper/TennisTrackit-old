//
//  MenuListDisplayItem.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class MenuListDisplayItem: SectionItem {
    
    var id: Int
    var text: String
    var icon: UIImage?
    
    init(id: Int, text: String, icon: UIImage?) {
        self.id = id
        self.text = text
        self.icon = icon
    }
    
    // MARK: - SectionItem
    
    var identifier: String { get { return String(id) } }
}
