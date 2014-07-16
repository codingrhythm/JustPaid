//
//  BookItemReminder.swift
//  Book Item Reminder
//
//  Created by Zack Zhu on 15/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

class BookItemReminder: NSManagedObject {

    @NSManaged var recurrence_rate: String
    @NSManaged var recurrence_step: NSNumber
    @NSManaged var start_date: NSDate
    @NSManaged var bookItems: NSSet

}
