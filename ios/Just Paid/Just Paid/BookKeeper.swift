//
//  BookKeeper.swift
//  Just Paid
//
//  Created by Zack Zhu on 22/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

class BookKeeper: CKEntity {

    @NSManaged var identifier: String
    @NSManaged var isLocal: NSNumber
    @NSManaged var name: String

}
