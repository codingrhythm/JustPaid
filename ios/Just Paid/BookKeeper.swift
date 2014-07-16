//
//  BookKeeper.swift
//  Book Keeper
//
//  Created by Zack Zhu on 15/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

class BookKeeper: NSManagedObject {

    @NSManaged var identifier: String
    @NSManaged var isLocal: NSNumber
    @NSManaged var name: String
    @NSManaged var bookItems: NSSet
    @NSManaged var familyBooks: NSSet
    @NSManaged var ownedFamilyBooks: NSSet

}
