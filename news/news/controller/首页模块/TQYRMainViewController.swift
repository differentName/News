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
        let main_xinwen = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_xinwen.keyStr = "xinwen"
        let main_caijing = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_caijing.keyStr = "caijing"
        let main_tiyu = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_tiyu.keyStr = "tiyu"
        let main_yule = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_yule.keyStr = "yule"
        let main_junshi = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_junshi.keyStr = "junshi"
        let main_jiaoyu = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_jiaoyu.keyStr = "jiaoyu"
        let main_keji = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_keji.keyStr = "keji"
        let main_NBA = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_NBA.keyStr = "NBA"
        let main_gupiao = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_gupiao.keyStr = "gupiao"
        let main_xingzuo = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_xingzuo.keyStr = "xingzuo"
        let main_nvxing = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_nvxing.keyStr = "nvxing"
        let main_jiankang = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_jiankang.keyStr = "jiankang"
        let main_yuer = TQYRMainTableViewController.init(style: UITableViewStyle.plain)
        main_yuer.keyStr = "yuer"
        
        let mainControllerAry = [main_toutiao,main_xinwen,main_caijing,main_tiyu,main_yule,main_junshi,main_jiaoyu,main_keji,main_NBA,main_gupiao,main_xingzuo,main_nvxing,main_jiankang,main_yuer]
      
        let mainControllerTitleAry = ["头条","新闻","财经","体育","娱乐","军事","教育","科技","NBA","股票","星座","女性","健康","育儿"]
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
