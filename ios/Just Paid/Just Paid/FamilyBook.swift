//
//  FamilyBook.swift
//  Just Paid
//
//  Created by Zack Zhu on 15/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

class FamilyBook: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var members: NSSet
    @NSManaged var owner: BookKeeper

}
