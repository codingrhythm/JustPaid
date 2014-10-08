//
//  MemeberCell.swift
//  Just Paid
//
//  Created by Zack Zhu on 4/08/2014.
//  Copyright (c) 2014 Zack Zhu. All rights reserved.
//

import UIKit


class MemeberCell: UITableViewCell {
    @IBOutlet var photoView:UIImageView!
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var categoryIcon:UIImageView!
    @IBOutlet var recentActivityLabel:UILabel!
    @IBOutlet var recentActivityTimeLabel:UILabel!
    @IBOutlet var ownerIcon:UIImageView!
    
    var member:Dictionary<String, Any>! {
        didSet {
            self.nameLabel.text = self.member["name"] as String
            self.recentActivityLabel.text = self.member["recent_activity"] as String
            self.categoryIcon.image = UIImage(named: self.member["category"] as String + "SmallIcon")
            self.recentActivityTimeLabel.text = self.member["recent_activity_time"] as String
            
            if (self.member["is_owner"] as Bool){
                self.ownerIcon.hidden = false
            }else{
                self.ownerIcon.hidden = true
            }
            
            self.photoView.image = UIImage(named: "defaultAvatarIcon")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Add line
        let line:UIImageView = UIImageView(frame: CGRectMake(-50, self.frame.size.height-0.5, self.frame.size.width+100, 0.5))
        line.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        self.contentView.addSubview(line)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.photoView!.layer.cornerRadius = 36
    }

}
