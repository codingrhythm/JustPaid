//
//  CloudManager.swift
//  Just Paid
//
//  Created by Zack Zhu on 23/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CloudKit

/**
Global shared instance for ClouldKit Manager
*/
let CKMShareInstance = CloudKitManager()
let PrivateZoneName = "Just Paid Zone"

/**
CloudKit management class that provides essential functions to work with cloudkit
*/
class CloudKitManager:NSObject{
    
    /**
    CloudKit container
    */
    var container:CKContainer?
    
    /**
    Specifies instance of private database of current user
    */
    var privateDatabase:CKDatabase?
    
    /**
    Specifies instance of public database
    */
    var publicDatabase:CKDatabase?
    
    /**
    constructor
    */
    init(){
        super.init()
        
        // get default container
        self.container = CKContainer.defaultContainer()
        
        // get private database instance
        self.privateDatabase = self.container!.privateCloudDatabase
        
        // get public database instance
        self.publicDatabase = self.container!.publicCloudDatabase
        
        // check if user has logged in iCloud account
        self.checkUserAccountStatus()
        
    }
    
    func checkUserAccountStatus(){
        func accountStatusChecked(status:CKAccountStatus, error:NSError!){
            if error{
                println(error)
            }
            
            println(status)
            
            self.requestApplicationPermission()
            self.initPrivateZone()
        }
        
        self.container!.accountStatusWithCompletionHandler(accountStatusChecked)
    }
    
    func requestApplicationPermission(){
        func applicationPermissionRequested(permission:CKApplicationPermissionStatus, error:NSError!){
            
            if error{
                println("failed to request app permission")
                println(error)
                return
            }
            
            println(permission)
            
        }
        
        println("request for app permission")
        self.container!.requestApplicationPermission(CKApplicationPermissions.PermissionUserDiscoverability, applicationPermissionRequested);
    }
    
    func initPrivateZone(){
        
        func recordZoneSaved(zone:CKRecordZone?, error:NSError?){
            if error{
                println("failed to save record zone")
                println(error)
                return
            }
            
            println("record zone inited")
        }
        
        CKMShareInstance.privateDatabase!.saveRecordZone(CKRecordZone(zoneName: PrivateZoneName), recordZoneSaved)
    }
    
    func start(){
        println("start")
    }
}

