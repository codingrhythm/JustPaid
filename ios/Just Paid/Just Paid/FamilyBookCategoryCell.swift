//
//  FamilyBookCategoryCell.swift
//  Just Paid
//
//  Created by Zack Zhu on 7/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class FamilyBookCategoryCell: UICollectionViewCell {
    var backgroundRingLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!
    
    @IBInspectable var rating: Double = 0.6 {
        didSet{
            updateLayerProperties()
        }
    }
    
    var lineWidth: CGFloat = 2.0 {
        didSet{
            updateLayerProperties()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let rect = CGRectInset(bounds, lineWidth / 2.0, lineWidth / 2.0)
        let path = UIBezierPath(ovalInRect: rect)
        
        // Draw the background ring layer
        if !backgroundRingLayer{
            backgroundRingLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer)
            
            backgroundRingLayer.path = path.CGPath
            backgroundRingLayer.fillColor = nil
            backgroundRingLayer.lineWidth = lineWidth
            backgroundRingLayer.strokeColor = UIColor.whiteColor().colorWithAlphaComponent(0.3).CGColor
        }
        
        backgroundRingLayer.frame = layer.bounds
        
        
        // Draw the ring layer
        if !ringLayer{
            ringLayer = CAShapeLayer()
            
            ringLayer.path = path.CGPath
            ringLayer.fillColor = nil
            ringLayer.lineWidth = lineWidth
            ringLayer.strokeColor = UIColor(red: 37.0/255.0, green: 155.0/255.0, blue: 36.0/255.0, alpha: 1.0).CGColor
            ringLayer.anchorPoint = CGPointMake(0.5, 0.5)
            ringLayer.transform = CATransform3DRotate(ringLayer.transform, -CGFloat(M_PI) / 2, 0, 0, 1)
            layer.addSublayer(ringLayer)
        }
        
        ringLayer.frame = layer.bounds
        
        updateLayerProperties()
    }
    
    func updateLayerProperties(){
        if ringLayer{
            ringLayer.strokeEnd = CGFloat(rating)
        }
    }
}
