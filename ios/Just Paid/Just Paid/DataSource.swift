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
        dataSet.addObject(member)
        
        let member1 = NSMutableDictionary()
        member1["name"] = "Erin Wang"
        member1["recent_activity"] = "Just paid $109.42"
        member1["category"] = "clothes"
        dataSet.addObject(member1)
        
        return dataSet
    }()
}