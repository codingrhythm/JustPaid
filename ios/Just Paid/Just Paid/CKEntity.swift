//
//  CKEntity.swift
//  Just Paid
//
//  Created by Zack Zhu on 22/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData
import CloudKit

class CKEntity: NSManagedObject {

    // MARK: Managed Properties
    
    let zoneName:String = "Just Paid Zone"
    let ownerName:String = "Just Paid Owner"
    
    // MARK: Properties
    lazy var zoneID:CKRecordZoneID = {
        return CKRecordZoneID(zoneName:self.zoneName, ownerName: self.ownerName)
    }()
    
    var recordType:String {
        return "default"
    }
    
    
    var cloudKitRecord: CKRecord {
        var record:CKRecord = CKRecord(recordType: self.recordType, zoneID: self.zoneID)
        return record
    }
    
    init(entity: NSEntityDescription!, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    // Sync to private database
    func sync(){
        
        // record save handler
        func recordSaved(record:CKRecord?, error:NSError?){
            if error{
                // handle the error
                println(error)
                return
            }
            
            println(record)
        }
        
        // save to private database
        CKMShareInstance.privateDatabase.saveRecord(self.cloudKitRecord, completionHandler: recordSaved)
    }
    
    
}
