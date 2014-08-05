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
    var member:NSMutableDictionary! {
        didSet {
            self.nameLabel.text = self.member["name"] as String
            self.recentActivityLabel.text = self.member["recent_activity"] as String
            self.categoryIcon.image = UIImage(named: self.member["category"] as String + "SmallIcon")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.photoView!.layer.cornerRadius = 36
    }

}
