//
//  TQYRMainListTableViewCell.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/15.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit
import SDWebImage

class TQYRMainListTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var fenlei: UILabel!
    @IBOutlet weak var laiyuan: UILabel!
    @IBOutlet weak var time: UILabel!
    //这是定义一个变量  并实现其set和get方法  didset是指该变量发生变化的时候就会调用
    var model : TQYRMainListModel?{
        didSet{
            title.text = model?.title
            fenlei.text = model?.category
            laiyuan.text = model?.src
            time.text = model?.time
            pic.sd_setImage(with: URL.init(string: (model?.pic)!))
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pic.layer.cornerRadius = 8;
        pic.clipsToBounds = true;
        
        
        fenlei.layer.cornerRadius = 10;
        fenlei.clipsToBounds = true;
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //加上static修饰符 这个方法就成为类方法 可以有类直接调用
   static func creatCellWithTableview(tableView:UITableView) -> TQYRMainListTableViewCell {
    
        var cell = tableView.dequeueReusableCell(withIdentifier: "TQYRMainListTableViewCell")  as? TQYRMainListTableViewCell
        if tableView.dequeueReusableCell(withIdentifier: "TQYRMainListTableViewCell") == nil {
            cell = Bundle.main.loadNibNamed("TQYRMainListTableViewCell", owner: self, options: nil)?.first as? TQYRMainListTableViewCell
        }
        cell?.selectionStyle =  UITableViewCellSelectionStyle.none
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    
    
    
}
