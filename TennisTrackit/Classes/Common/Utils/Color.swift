//
//  Color.swift
//  TennisTrackit
//
//  Created by Annie on 18/03/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation
import HxColor

public struct Color {
    
    public static func navigationGreen() -> UIColor {
        return UIColor(0x006600)
    }
    
    public static func navigationYellow() -> UIColor {
        return UIColor(0xffffcc)
    }
    
    public static func homeYellow() -> UIColor {
        return UIColor(0xffffb3)
    }
    
    public static func homeOlive() -> UIColor {
        return UIColor(0xe6e600)
    }
    
    public static func homeDarkOlive() -> UIColor {
        return UIColor(0x999900)
    }
    
    public static func checkboxYellow() -> UIColor {
        return UIColor(0xF7D842)
    }
    
    public static func checkboxGreen() -> UIColor {
        return UIColor(0x90EE90)
    }
    
    public static func textViewBorderColor() -> CGColor {
        return UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.0).cgColor
    }
    
}
