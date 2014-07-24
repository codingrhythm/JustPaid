//
//  BookItemReminder.swift
//  Just Paid
//
//  Created by Zack Zhu on 22/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

class BookItemReminder: CKEntity {

    @NSManaged var recurrenceRate: String
    @NSManaged var recurrenceStep: NSNumber
    @NSManaged var startDate: NSDate
    @NSManaged var referenceID: String
    @NSManaged var changeToken: String
    @NSManaged var synced: String

}
