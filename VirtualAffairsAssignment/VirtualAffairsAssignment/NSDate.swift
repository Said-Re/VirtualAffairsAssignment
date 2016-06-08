//
//  NSDate.swift
//  VirtualAffairsAssignment
//
//  Created by Said Rehouni on 7/6/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

import Foundation

let Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

extension NSDate {
    
    //String format for a date
    func formatDate() -> String {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: self)
        
        return "\(components.day) \(Months[components.month - 1]) \(components.year)"
    }
    
    //String format for a week after the date
    func formatDateAfterWeek() -> String {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: self.dateByAddingTimeInterval(60 * 60 * 24 * 7))
        
        return "\(components.day) \(Months[components.month - 1]) \(components.year)"
    }
    
}

//Method for comparing 2 dates
func == (left: NSDate, right: NSDate) -> Bool {
    
    let calendar = NSCalendar.currentCalendar()
    let componentsLeft = calendar.components([.Day , .Month , .Year], fromDate: left)
    let componentsRight = calendar.components([.Day , .Month , .Year], fromDate: right)
    
    if componentsLeft.day == componentsRight.day && componentsLeft.month == componentsRight.month && componentsLeft.year == componentsRight.year {
        return true
    } else {
        return false
    }
    
}

