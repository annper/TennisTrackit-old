//
//  HomeListTableViewCell.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class HomeListTableViewCell: UITableViewCell {
    
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.font = Font.regularTennisFontWithSketchSize(size: Font.size36)
            titleLabel.textColor = UIColor.white
            titleLabel.shadowColor = UIColor.black
            titleLabel.shadowOffset.width = CGFloat(3)
            titleLabel.shadowOffset.height = CGFloat(2)

        }
    }
    
    func setupWith(display: HomeListDisplayItem) {
        containerView.backgroundColor = display.backgroundColor
        titleLabel.text = display.text
    }

}
