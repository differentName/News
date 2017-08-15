//
//  TQYRPicListTableViewCell.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/15.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit

class TQYRPicListTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var fenlei: UILabel!
    @IBOutlet weak var laiyuan: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pic.layer.cornerRadius = 5;
        pic.clipsToBounds = true;
        
        self.selectionStyle =  UITableViewCellSelectionStyle.none;
        self.backgroundColor = UIColor.clear;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
