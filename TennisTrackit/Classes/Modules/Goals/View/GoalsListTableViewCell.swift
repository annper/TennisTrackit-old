//
//  GoalsListTableViewCell.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsListTableViewCell: UITableViewCell {
    
    private let cellHeight: CGFloat = 60
    private let animationDelay: TimeInterval = 0.3
    
    @IBOutlet var deleteButtonWidthConstraint: NSLayoutConstraint! {
        didSet {
            // Hide delete view
            deleteButtonWidthConstraint.constant = 0
        }
    }
    
    @IBOutlet var deleteButton: UIButton! {
        didSet {
            deleteButton.setTitle("Delete".localized(), for: .normal)
            deleteButton.setTitleColor(UIColor.red, for: .normal)
            deleteButton.backgroundColor = UIColor.lightGray
            deleteButton.titleLabel?.font = Font.lightFontWithSketchSize(size: Font.size12)
        }
    }
        
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.font = Font.regularTennisFontWithSketchSize(size: Font.size18)
            titleLabel.textColor = Color.navigationGreen()
            titleLabel.textAlignment = .left
            titleLabel.numberOfLines = 1
        }
    }
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = Font.lightFontWithSketchSize(size: Font.size16)
            descriptionLabel.textColor = Color.homeDarkOlive()
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .left
            descriptionLabel.numberOfLines = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Color.navigationYellow()
    }
    
    private func animateDeleteButtonWith(buttonWidth: CGFloat) {
        Timer.after(0.2) {
            self.deleteButtonWidthConstraint.constant = buttonWidth
            
            UIView.animate(withDuration: self.animationDelay, animations: {
                self.contentView.layoutIfNeeded()
            })
        }
    }
    
    func setupWith(display: GoalsListDisplayItem) {
        titleLabel.text = display.title
        descriptionLabel.text = display.description
    }
    
    func showDeleteButton() {
        animateDeleteButtonWith(buttonWidth: cellHeight)
    }
    
    func hideDeleteButton() {
        animateDeleteButtonWith(buttonWidth: 0)
    }

}
