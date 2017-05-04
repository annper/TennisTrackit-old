//
//  CheckboxButton.swift
//  TennisTrackit
//
//  Created by Annie on 04/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation
import UIKit

class CheckboxButton: UIButton {
    
    private let checkedImage = UIImage(named: "marked-checkbox")
    private let emptyImage = UIImage(named: "empty-checkbox")
    
    var isChecked: Bool = false {
        didSet {
            if true == isChecked {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(emptyImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        if sender == self  {
            isChecked = !isChecked
        }
    }
    
}
