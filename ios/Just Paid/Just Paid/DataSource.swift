//
//  DataSource.swift
//  Just Paid
//
//  Created by Zack Zhu on 5/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import Foundation

let dataSource = DataSource()

class DataSource{
    var familyBookMembers:NSMutableArray = {
        let dataSet:NSMutableArray = []
        
        let member = NSMutableDictionary()
        member["name"] = "Zack Zhu"
        member["recent_activity"] = "Just paid $20.00"
        member["category"] = "supermarket"
        member["recent_activity_time"] = "2 hours ago"
        member["is_owner"] = true
        dataSet.addObject(member)
        
        let member1 = NSMutableDictionary()
        member1["name"] = "Erin Wang"
        member1["recent_activity"] = "Just paid $109.42"
        member1["recent_activity_time"] = "30 Jul 14"
        member1["category"] = "clothes"
        member1["is_owner"] = false
        dataSet.addObject(member1)
        
        return dataSet
    }()
}