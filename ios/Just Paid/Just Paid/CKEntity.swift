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

let SyncStatusOffline = "offline"
let SyncStatusSynced = "synced"
let SyncStatusChanged = "changed"
let SyncStatusDeleted = "deleted"

@objc protocol CKEntityProtocol {
     func sync()
}

class CKEntity: NSManagedObject, CKEntityProtocol {
    
    // MARK: Enumeration
    
    
    // MARK: Properties
    @NSManaged var ck_privateReferenceID: String
    @NSManaged var ck_privateChangeTag: String
    
    /**
     Specifies the cloudkit sync status for current record.
    */
    @NSManaged var ck_privateSyncStatus: String
    @NSManaged var ck_publicReferenceID: String
    @NSManaged var ck_publicChangeTag: String
    @NSManaged var ck_publicSyncStatus: String
    @NSManaged var ck_isDirty:NSNumber
    
    var zoneID:CKRecordZoneID {
        return CKRecordZoneID(zoneName:PrivateZoneName, ownerName: CKOwnerDefaultName)
    }
    
    var privateRecordID:CKRecordID {
       return CKRecordID(recordName: self.ck_privateReferenceID, zoneID: self.zoneID)
    }
    
    var publicRecordID:CKRecordID {
        return CKRecordID(recordName: self.ck_publicReferenceID)
    }
    
    var recordType:String {
        return "default"
    }
    
    
    var cloudKitPrivateRecord: CKRecord  {
        var record:CKRecord = CKRecord(recordType: self.recordType, zoneID: self.zoneID)
        return record
    }
    
    var cloudKitPublicRecord: CKRecord {
        var record:CKRecord = CKRecord(recordType: self.recordType)
        return record
    }
    
    override init(entity: NSEntityDescription!, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    // Sync with public database
    internal func syncWithPublicDB(){
        
        // record save handler
        func recordSaved(record:CKRecord?, error:NSError?){
            if (error != nil){
                // handle the error
                println(error)
                return
            }
            
            println(record)
        }
        
        // save to public database
        CKMShareInstance.publicDatabase.saveRecord(self.cloudKitPrivateRecord, completionHandler: recordSaved)
    }
    
    // Sync to private database
    private func syncWithPrivateDB(){
        // record save handler
        func recordSaved(record:CKRecord?, error:NSError?){
            if (error != nil){
                // handle the error
                println(error)
                return
            }
            
            println("record synced in private database")
            self.ck_privateReferenceID = record!.recordID.recordName
            self.ck_privateChangeTag = record!.recordChangeTag
            self.ck_privateSyncStatus = SyncStatusSynced
            self.ck_isDirty = 0
            self.managedObjectContext.save(nil)
        }
        
        func recordDeleted(recordID:CKRecordID?, error:NSError?){
            if (error != nil){
                println(error)
                return
            }
            
            println("record delted from private database")
            self.managedObjectContext.deleteObject(self)
        }
        
        // record process block
        func recordProgressChanged(record:CKRecord?, progress:Double){
            println("progress changed")
        }
        
        // save to public database
        if self.ck_privateSyncStatus == SyncStatusOffline {
            // save as new record
            CKMShareInstance.privateDatabase.saveRecord(self.cloudKitPrivateRecord, completionHandler: recordSaved)
        }
        else if self.ck_privateSyncStatus == SyncStatusDeleted {
            CKMShareInstance.privateDatabase.deleteRecordWithID(self.privateRecordID, completionHandler: recordDeleted)
        }else{
            // update the old record
            
            func recordFetched(record:CKRecord?, error:NSError?){
                if (error != nil){
                    // handle the error
                    println(error)
                    return
                }
                
                let modifyOperation:CKModifyRecordsOperation = CKModifyRecordsOperation(recordsToSave: nil, recordIDsToDelete: nil)
                
                modifyOperation.recordsToSave = [self.getCloudKitRecord(record!)]
                modifyOperation.perRecordCompletionBlock = recordSaved
                modifyOperation.perRecordProgressBlock = recordProgressChanged
                CKMShareInstance.privateDatabase.addOperation(modifyOperation)
                
            }
            
            
            // fetch the record for server first
            CKMShareInstance.privateDatabase.fetchRecordWithID(self.privateRecordID, completionHandler: recordFetched)
            
        }
    }
    
    
    internal func getCloudKitRecord(record:CKRecord) -> CKRecord{
        return record
    }
    
    internal func sync() {
        if self.ck_privateSyncStatus == SyncStatusDeleted{
            // this record is deleted
            self.syncWithPrivateDB()
            return
        }
        
        let changedValues: NSDictionary = self.changedValues() as NSDictionary
        
        var valueChanged = false
        for (key, value) in changedValues{
            if (!key.hasPrefix("ck_")){
                valueChanged = true
                break
            }
        }
        
        if valueChanged{
            self.syncWithPrivateDB()
        }
    }
    
    internal func markAsDeleted() {
        self.ck_privateSyncStatus = SyncStatusDeleted
        self.ck_publicSyncStatus = SyncStatusDeleted
        self.managedObjectContext.save(nil)
    }
}
