//
//  ViewControllerExtension.swift
//  VirtualAffairsAssignment
//
//  Created by Said Rehouni on 8/6/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

import Foundation

extension ViewController {
    //Set the schedule for editing it
    func setSchedule(scheduleItem: ScheduleItemModel) {
        beginDate = scheduleItem.beginDate
        endDate = scheduleItem.endDate
        guard let date = beginDate.dateFromString() else {
            datePicker = NSDate()
            return
        }

        datePicker = date
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().postNotificationName(kUpdateScheduleNotification, object: nil, userInfo: ["beginDate" : beginDate, "endDate" : endDate])
    }
}

extension String {
    //Returns a NSDate from a String
    func dateFromString() -> NSDate? {
        let components = self.componentsSeparatedByString(" ")
        if components.count == 3 {
            let dateComponents = NSDateComponents()
            if let day = Int(components[0]), month = Months.indexOf(components[1]), year = Int(components[2]) {
                dateComponents.day = day
                dateComponents.month = month + 1
                dateComponents.year = year
                
                return NSCalendar.currentCalendar().dateFromComponents(dateComponents)
            }
        }
        
        return nil
    }
}