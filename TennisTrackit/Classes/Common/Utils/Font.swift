//
//  Font.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import UIKit

struct Font {
    
    static let size36: CGFloat = 36
    static let size30: CGFloat = 30
    static let size26: CGFloat = 26
    static let size20: CGFloat = 20
    static let size18: CGFloat = 18
    static let size15: CGFloat = 15
    static let size16: CGFloat = 16
    static let size14: CGFloat = 14
    static let size12: CGFloat = 12
    static let size10: CGFloat = 10
    
    // MARK: - Font
    
    static func mediumFontWithSketchSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
    
    static func thinFontWithSketchSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Thin", size: size)!
    }
    
    static func lightFontWithSketchSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
    
    static func boldFontWithSketchSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
    }
}
