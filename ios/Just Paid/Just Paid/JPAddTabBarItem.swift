//
//  JPAddTabBarItem.swift
//  Just Paid
//
//  Created by Zack Zhu on 7/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

class JPAddTabBarItem: JPTabBarItem {
    override func awakeFromNib() {
        image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        selectedImage = selectedImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    }
}
