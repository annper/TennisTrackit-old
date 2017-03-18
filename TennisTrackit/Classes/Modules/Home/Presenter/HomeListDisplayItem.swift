//
//  HomeListDisplayItem.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class HomeListDisplayItem: SectionItem {
    
    var id: Int
    var text: String
    var backgroundColor: UIColor
    var image: UIImage?
    
    init(id: Int, text: String, backgroundColor: UIColor, image: UIImage?) {
        self.id = id
        self.text = text
        self.backgroundColor = backgroundColor
        self.image = image
    }
    
    // MARK: - SectionItem
    
    var identifier: String { get { return String(id) } }
}
