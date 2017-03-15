//
//  NSDate.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation

public extension Date {
    
    func isToday() -> Bool {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        return calendar!.isDateInToday(self)
    }
    
    func isTomorrow() -> Bool {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        return calendar!.isDateInTomorrow(self)
    }
    
    func isYesterday() -> Bool {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        return calendar!.isDateInYesterday(self)
    }
    
    func isLaterThan(date: Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedDescending
    }
    
    func isInCurrentMonth() -> Bool {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.month], from: self)
        let currentComponents = calendar.dateComponents([.month], from: Date())
        
        let month = components.month
        let currentMonth = currentComponents.month
        
        return month == currentMonth
    }
        
}
