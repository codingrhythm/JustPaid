//
//  CloudManager.swift
//  Just Paid
//
//  Created by Zack Zhu on 23/07/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation
import CloudKit

// global shared instance
let CKMShareInstance = CloudKitManager()

class CloudKitManager{

    var container:CKContainer
    var privateDatabase:CKDatabase
    var publicDatabase:CKDatabase
    
    init(){
        self.container = CKContainer.defaultContainer()
        self.privateDatabase = self.container.privateCloudDatabase
        self.publicDatabase = self.container.publicCloudDatabase
    }
}

