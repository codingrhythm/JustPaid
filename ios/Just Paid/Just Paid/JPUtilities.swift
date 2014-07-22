//
//  JPUtilities.swift
//  Just Paid
//
//  Created by Zack Zhu on 17/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CoreData


class JPUtilities {
    
    var applicationDocumentDirectory : NSURL {
        // return directory that app used to store core data file
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let appDocURL:AnyObject = urls[urls.endIndex-1]
        return appDocURL as NSURL
    }
    
    var persistentStoreURL : NSURL {
        return self.applicationDocumentDirectory.URLByAppendingPathComponent("JustPaid.sqlite")
    }
    
    lazy var managedObjectModel : NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("JustPaidModel", withExtension: "momd")
        return NSManagedObjectModel(contentsOfURL:modelURL)
    }()
    
    
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
    
    func managedObjectContext() -> NSManagedObjectContext? {
        let coordinator = self.persistentStoreCoordinator
        
        if !coordinator{
            return nil
        }
        
        let context = NSManagedObjectContext()
        context.persistentStoreCoordinator = coordinator!
        return context
    }
}
