//
//  BookItemTag.swift
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
    
    override var recordType:String {
        return "BookItemTag"
    }
    
    override var cloudKitPrivateRecord:CKRecord {
        return self.getCloudKitRecord(super.cloudKitPrivateRecord)
    }
    
    override var cloudKitPublicRecord:CKRecord {
        return self.getCloudKitRecord(super.cloudKitPublicRecord)
    }
    
    public override func getCloudKitRecord(record:CKRecord) -> CKRecord{
        let thisRecord = super.getCloudKitRecord(record)
        thisRecord.setObject(self.tag, forKey: "tag")
        return thisRecord
    }
    
    // MARK: Class Methods
    
    // Create tag
    class func create(tag:String) -> BookItemTag? {
        let moc = CDMSharedInstance.managedObjectContext!
        let newObject = NSEntityDescription.insertNewObjectForEntityForName("BookItemTag", inManagedObjectContext: moc) as BookItemTag
        
        newObject.tag = tag
        moc.save(nil)
        
        return newObject
    }
}
