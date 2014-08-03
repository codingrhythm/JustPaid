//
//  FamilyBook.swift
//  Just Paid
//
//  Created by Zack Zhu on 22/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

class FamilyBook: CKEntity {

    @NSManaged var name: String
    @NSManaged var ownerID: String

}
