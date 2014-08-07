//
//  JPTabBarItem.swift
//  Just Paid
//
//  Created by Zack Zhu on 7/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

@IBDesignable
class JPTabBarItem: UITabBarItem {
    
    @IBInspectable var selectedImageName:String!{
        didSet{
            selectedImage = UIImage(named: selectedImageName)
            selectedImage = selectedImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        }
    }
}
