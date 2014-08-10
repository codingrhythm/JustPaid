//
//  DismissSegue.swift
//  Just Paid
//
//  Created by Zack Zhu on 11/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

class DismissSegue: UIStoryboardSegue {
    override func perform() {
        sourceViewController.presentingViewController!.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
}
