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
    var familyBookMembers:[Dictionary<String, Any>] = {
        let dataSet:[Dictionary<String, Any>] = [
            [
                "name":"Zack Zhu",
                "recent_activity":"Just paid $20.00",
                "category":"supermarket",
                "recent_activity_time":"2 hours ago",
                "is_owner":true
            ],
            [
                "name":"Erin Wang",
                "recent_activity":"Just paid $109.42",
                "category":"clothes",
                "recent_activity_time":"30 Jul 14",
                "is_owner":false
            ],
        ]
        
        return dataSet
    }()
    
    var familyBookMembers2:[Dictionary<String, Any>] = {
        let dataSet:[Dictionary<String, Any>] = [
            [
                "name":"Erin Wang",
                "recent_activity":"Just paid $10.00",
                "category":"supermarket",
                "recent_activity_time":"5 mins ago",
                "is_owner":true
            ],
            [
                "name":"Wiki Zhu",
                "recent_activity":"Just paid $5.87",
                "category":"clothes",
                "recent_activity_time":"30 Aug 14",
                "is_owner":false
            ],
        ]
        
        return dataSet
    }()
    
    
    var familyBookCategories:[Dictionary<String, Any>] = {
        let dataSet:[Dictionary<String, Any>] = [
            ["name":"clothes", "percent":0.3],
            ["name":"entertainment", "percent":0.25],
            ["name":"pet", "percent":0.22],
            ["name":"restaurant", "percent":0.15],
            ["name":"supermarket", "percent":0.08],
            ["name":"pet", "percent":0.22],
            ["name":"restaurant", "percent":0.15],
            ["name":"supermarket", "percent":0.08]
        ]
        
        return dataSet
    }()
    
    var familyBookCategories2:[Dictionary<String, Any>] = {
        let dataSet:[Dictionary<String, Any>] = [
            ["name":"entertainment", "percent":0.52],
            ["name":"pet", "percent":0.48]
        ]
        
        return dataSet
        }()
    
    var familyBooks:[Dictionary<String, Any>] = {
        let dataSet:[Dictionary<String, Any>] = [
            [
                "name":"Zack & Erin",
                "amount":2730.64,
            ],
            [
                "name":"Wiki's Book",
                "amount":158.43
            ]
        ]
        
        return dataSet
    }()
}