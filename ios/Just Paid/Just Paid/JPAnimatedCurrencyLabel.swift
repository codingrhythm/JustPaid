//
//  JPAnimatedCurrencyLabel.swift
//  Just Paid
//
//  Created by Zack Zhu on 8/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

class JPAnimatedCurrencyLabel: JPCurrencyLabel {

    private var animateStep:Float = 1
    private var currentAmount:Float = 0
    private var animationTimer:NSTimer!
    
    override func amountDidChanged(from: Float, to: Float) {
        
        currentAmount = from
        
        self.updateLabel(currentAmount)
        
        let delta:Float = to - from
        
        animateStep = 1
        
        if abs(delta) > 100{
            animateStep *= delta / 100
        }
        
        animationTimer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector("animateNumber"), userInfo: nil, repeats: true)
    }
    
    func animateNumber(){
        currentAmount += animateStep
        
        if (animateStep > 0){
            if (currentAmount >= amount){
                currentAmount = amount
                animationTimer.invalidate()
            }
        }else{
            if (currentAmount <= amount){
                currentAmount = amount
                animationTimer.invalidate()
            }
        }
        
        self.updateLabel(currentAmount)
    }
}
