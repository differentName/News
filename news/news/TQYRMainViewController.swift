//
//  TQYRMainViewController.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/14.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit
import MJCSegmentInterface

class TQYRMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let main_toutiao = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_toutiao.keyStr = "toutiao"
        let main_yule = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_yule.keyStr = "yule"
        let main_tiyu = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_tiyu.keyStr = "tiyu"
        let main_caijing = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_caijing.keyStr = "caijing"
        let main_keji = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_keji.keyStr = "keji"
        let main_qiche = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_qiche.keyStr = "qiche"
        let main_shehui = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_shehui.keyStr = "shehui"
        let main_junshi = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_junshi.keyStr = "junshi"
        let main_shishang = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_shishang.keyStr = "shishang"
        let main_fangchan = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_fangchan.keyStr = "fangchan"
        let main_lishi = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_lishi.keyStr = "lishi"
        let main_jiaju = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_jiaju.keyStr = "jiaju"
        let main_jiankang = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_jiankang.keyStr = "jiankang"
        
        let mainControllerAry = [main_toutiao,main_yule,main_tiyu,main_caijing,main_keji,main_qiche,main_shehui,main_junshi,main_shishang,main_fangchan,main_lishi,main_jiaju,main_jiankang]
      
        let mainControllerTitleAry = ["头条","娱乐","体育","财经","科技","汽车","社会","军事","时尚","房产","历史","家具","健康"]
        //  准备工作做好之后,接来下实例化我的控件
        let segmentsface = MJCSegmentInterface.init()
        segmentsface.itemTextNormalColor = UIColor .gray
        segmentsface.itemTextSelectedColor = UIColor.red
        segmentsface.indicatorHidden = true
        segmentsface.isFontGradient = true
        segmentsface.isChildScollAnimal = false
        segmentsface.frame = CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-64)
    segmentsface.intoTitlesArray(mainControllerTitleAry, hostController: self)
        segmentsface.intoChildControllerArray(mainControllerAry)
        self.view.addSubview(segmentsface)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
