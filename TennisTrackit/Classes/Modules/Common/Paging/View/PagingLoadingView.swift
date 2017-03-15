//
//  PagingLoadingView.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation
import UIKit

public class PagingLoadingView: UICollectionReusableView {
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView?
    
    // MARK: - UIView
    override public var intrinsicContentSize: CGSize {
        get {
            var size = super.intrinsicContentSize
            
            size.height = 80
            
            return size
        }
    }
    
}
