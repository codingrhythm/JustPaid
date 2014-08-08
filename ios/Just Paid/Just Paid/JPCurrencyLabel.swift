//
//  JPCurrencyLabel.swift
//  Just Paid
//
//  Created by Zack Zhu on 8/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit

@IBDesignable
class JPCurrencyLabel: UILabel {
    

    @IBInspectable var amount: Float = 0{
        
        didSet{
            if oldValue != amount {
                amountDidChanged(oldValue, to: amount)
            }
        }
    }
    
    internal func amountDidChanged(from:Float, to:Float){
        updateLabel(amount)
    }
    
    internal func updateLabel(displayAmount:Float){
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.locale = NSLocale.currentLocale()
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        text = currencyFormatter.stringFromNumber(NSNumber(float: displayAmount))
    }
}
