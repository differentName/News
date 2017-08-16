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
    var model : TQYRMainListModel? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pic.layer.cornerRadius = 5;
        pic.clipsToBounds = true;
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //加上static修饰符 这个方法就成为类方法 可以有类直接调用
   static func creatCellWithTableview(tableView:UITableView) -> TQYRPicListTableViewCell {
    
        var cell = tableView.dequeueReusableCell(withIdentifier: "TQYRPicListTableViewCell")  as? TQYRPicListTableViewCell
        if tableView.dequeueReusableCell(withIdentifier: "TQYRPicListTableViewCell") == nil {
            cell = Bundle.main.loadNibNamed("TQYRPicListTableViewCell", owner: self, options: nil)?.first as? TQYRPicListTableViewCell
        }
        cell?.selectionStyle =  UITableViewCellSelectionStyle.none
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    
    
    
}
