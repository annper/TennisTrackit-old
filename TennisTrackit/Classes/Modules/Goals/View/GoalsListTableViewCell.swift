//
//  GoalsListTableViewCell.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsListTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.font = Font.regularTennisFontWithSketchSize(size: Font.size18)
            titleLabel.textColor = Color.navigationGreen()
            titleLabel.textAlignment = .left
        }
    }
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = Font.lightFontWithSketchSize(size: Font.size16)
            descriptionLabel.textColor = Color.homeDarkOlive()
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .left
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Color.navigationYellow()
    }
    
    func setupWith(display: GoalsListDisplayItem) {
        titleLabel.text = display.title
        descriptionLabel.text = display.description
    }

}
