//
//  BookItem.swift
//  BookItem
//
//  Created by Zack Zhu on 15/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

class BookItem: NSManagedObject {

    @NSManaged var amount: NSNumber
    @NSManaged var bookDate: NSDate
    @NSManaged var bookDateDate: NSNumber
    @NSManaged var bookDateDay: NSNumber
    @NSManaged var bookDateHour: NSNumber
    @NSManaged var bookDateMinute: NSNumber
    @NSManaged var bookDateMonth: NSNumber
    @NSManaged var bookDateWeek: NSNumber
    @NSManaged var bookDateYear: NSNumber
    @NSManaged var category: String
    @NSManaged var isExpense: NSNumber
    @NSManaged var isPrivate: NSNumber
    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    @NSManaged var status: String
    @NSManaged var tags: String
    @NSManaged var bookKeeper: BookKeeper
    @NSManaged var reminder: BookItemReminder
    
    
}
