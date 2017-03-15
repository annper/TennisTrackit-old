//
//  PagingStateDataView.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation
import UIKit

class PagingStaleDataView: UIView {
    
    @IBOutlet var messageLabel: UILabel?
    
    // MARK: - PagingStaleDataView
    
    func setuptDefaultMessage() {
        
        messageLabel?.text = NSLocalizedString("Unable to refresh data.", comment: "")
    }
    
    // MAKR: - UIView
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.setuptDefaultMessage()
    }
}
