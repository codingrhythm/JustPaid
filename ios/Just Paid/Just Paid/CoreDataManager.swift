//
//  JPUtilities.swift
//  Just Paid
//
//  Created by Zack Zhu on 17/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData

/**
Global shared instance for Core data manager
*/
let CDMSharedInstance:CoreDataManager = CoreDataManager()

/**
Core Data Management class that provides essential functions to work with core data
*/
class CoreDataManager:NSObject {
    
    /**
    Specifies current application document directory
    */
    var applicationDocumentDirectory : NSURL {
        // return directory that app used to store core data file
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let appDocURL:AnyObject = urls[urls.endIndex-1]
        return appDocURL as NSURL
    }
    
    /**
    Specifies persisten store url
    */
    var persistentStoreURL : NSURL {
        return self.applicationDocumentDirectory.URLByAppendingPathComponent("JustPaid.sqlite")
    }
    
    /**
    Specifies managed object model, this variable is lazily created
    */
    lazy var managedObjectModel : NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("JustPaidModel", withExtension: "momd")
        return NSManagedObjectModel(contentsOfURL:modelURL)
    }()
    
    /**
    Specifies persistent store coordinator
    */
    var persistentStoreCoordinator : NSPersistentStoreCoordinator? {
        // return persistent store coordinator for the application
        let mom = self.managedObjectModel
            
        var coordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        var error:NSError?
            
        if coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: self.persistentStoreURL, options: nil, error: &error) == nil {
            return nil
        }
            
        return coordinator
    }
    
    
    /**
    Specifiies the managed object context, this variable is lazily created
    */
    lazy var managedObjectContext:NSManagedObjectContext? = {

        let coordinator = self.persistentStoreCoordinator
        
        if (coordinator == nil){
            return nil
        }
        
        let context = NSManagedObjectContext()
        
        // set persistent store coordinator for the managed object context
        context.persistentStoreCoordinator = coordinator!
        
        // add notification observer to context objects change notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextChanged:", name:NSManagedObjectContextObjectsDidChangeNotification, object:context)
        
        return context
    }()
    
    /**
     Handle the NSManagedObjectContextObjectsDidChangeNotification
    */
    private func contextChanged(notification:NSNotification){
        
        // a combined NSSet to store all changed objects
        var combinedSet: NSMutableSet?
        
        // get userInfo from notification object
        let userInfo:[NSObject:AnyObject] = notification.userInfo!
        
        // get all inserted objects
        let insertedObjects: NSSet? = userInfo[NSInsertedObjectsKey] as? NSSet
        combinedSet = NSMutableSet(set: insertedObjects)
        
        // get all updated objects
        let updatedObjects: NSSet? = userInfo[NSUpdatedObjectsKey] as? NSSet
        combinedSet!.unionSet(updatedObjects!)
        
        
        // loop the list, sync the object if it comforts with CKEntityProtocal
        if (combinedSet == nil){
            for object in combinedSet!{
                if let cloudKitObject = object as? CKEntityProtocol{
                    cloudKitObject.sync()
                }
            }
        }
        
        
    }
}
