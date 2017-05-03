//
//  GoalsAddNewListTableViewCell.swift
//  TennisTrackit
//
//  Created by Annie on 03/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation
import UIKit
import Localize_Swift

class GoalsAddNewListTableViewCell: UITableViewCell {
    
    @IBOutlet var addNewButton: UIButton! {
        didSet {
            addNewButton.backgroundColor = Color.navigationGreen()
            addNewButton.setTitle("+ Add new goal".localized(), for: .normal)
            addNewButton.layer.cornerRadius = 10
            addNewButton.setTitleColor(Color.navigationYellow(), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Color.navigationYellow()
    }
}