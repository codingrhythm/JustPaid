//
//  BookItemTags.swift
//  Just Paid
//
//  Created by Zack Zhu on 22/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData
import CloudKit

class BookItemTag: CKEntity {

    // MARK: Properties
    @NSManaged var tag: String
    @NSManaged var referenceID: String
    @NSManaged var changeToken: String
    @NSManaged var synced: String
    
    override var recordType:String {
        return "BookItemTags"
    }
    
    override var cloudKitRecord:CKRecord {
        var record = super.cloudKitRecord
            
        record.setObject(self.tag, forKey: "tag")
            
        return record
    }
    
    // MARK: Class Methods
    
    // Create tag
    class func create(tag:String) -> BookItemTag? {
        let newObject = NSEntityDescription.insertNewObjectForEntityForName("BookItemTag", inManagedObjectContext: CDMSharedInstance.managedObjectContext()) as BookItemTag
        
        newObject.sync()
        
        return newObject
    }
}
