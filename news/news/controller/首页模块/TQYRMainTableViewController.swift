//
//  TQYRMainTableViewController.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/14.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
class TQYRMainTableViewController: UITableViewController{//遵循代理
    var keyStr = ""
    var currentKeyStr = "头条"
    var currentIndex = 0
    let typeAry = ["头条","新闻","财经","体育","娱乐","军事","教育","科技","NBA","股票","星座","女性","健康","育儿"]
    var listAry :NSMutableArray = NSMutableArray.init()
    var page = 1
    var silenceCarouselView:SilenceCarouselView?
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        TQYRTool.showLoadingImg(controller: self)
        reloadDataWithKeyString(keyStr: keyStr)
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: { 
            self.reloadDataWithKeyString(keyStr: self.currentKeyStr)
        })
        self.tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.loadMoreDataWithType(type: self.currentIndex)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if self.listAry.count == 0 {
                return 0
            }else{
                return 1
            }
        }else{
            return self.listAry.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "MainTopCell")
            if (cell == nil) {
                cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "MainTopCell")
            }
            if ((cell?.contentView.viewWithTag(9528)) != nil) {
                cell?.contentView.viewWithTag(9528)?.removeFromSuperview()
            }
            cell?.backgroundColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0)
            let serverImages : NSMutableArray = NSMutableArray.init()
            let descs : NSMutableArray = NSMutableArray.init()
            var tempAry : NSArray = NSArray.init()
            
            if self.listAry.count>3 {
                tempAry = self.listAry.subarray(with: NSRange.init(location: 0, length: 3)) as NSArray
            }
            //swift 中的for循环
            for i in 0...2 {
                let tempModel : TQYRMainListModel = tempAry[i] as! TQYRMainListModel
                serverImages.add(tempModel.pic)
                descs.add(tempModel.title)
            }
            self.silenceCarouselView = SilenceCarouselView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150), imageArray: serverImages as [AnyObject] ,titleAry:descs as! [NSString],silenceCarouselViewTapBlock: { (carouselView, index) in
                self.pushToNewsDetailWithIndex(index:index)
            });
            self.silenceCarouselView?.tag = 9528
//            self.silenceCarouselView?.titleArray = 
            cell?.contentView.addSubview(self.silenceCarouselView!)
            return cell!
        }else{
            let cell :  TQYRMainListTableViewCell = TQYRMainListTableViewCell.creatCellWithTableview(tableView: tableView)
            
            let model : TQYRMainListModel  = self.listAry[indexPath.row] as! TQYRMainListModel
            cell.model = model
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushToNewsDetailWithIndex(index: indexPath.row)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }else{
            return 110
        }
    }
    

    func reloadDataWithKeyString(keyStr :String) {
        switch keyStr {
            case "toutiao":
                currentKeyStr = "toutiao"
                currentIndex = 0
                requestNewDataWithType(type: 0)
                print("toutiao")
            case "xinwen":
                currentKeyStr = "xinwen"
                currentIndex = 1
                requestNewDataWithType(type: 1)
                print("xinwen")
            case "caijing":
                currentKeyStr = "caijing"
                currentIndex = 2
                requestNewDataWithType(type: 2)
                print("caijing")
            case "tiyu":
                currentKeyStr = "tiyu"
                currentIndex = 3
                requestNewDataWithType(type: 3)
                print("tiyu")
            case "yule":
                currentKeyStr = "yule"
                currentIndex = 4
                requestNewDataWithType(type: 4)
                print("yule")
            case "junshi":
                currentKeyStr = "junshi"
                currentIndex = 5
                requestNewDataWithType(type: 5)
                print("junshi")
            case "jiaoyu":
                currentKeyStr = "jiaoyu"
                currentIndex = 6
                requestNewDataWithType(type: 6)
                print("jiaoyu")
            case "keji":
                currentKeyStr = "keji"
                currentIndex = 7
                requestNewDataWithType(type: 7)
                print("keji")
            case "NBA":
                currentKeyStr = "NBA"
                currentIndex = 8
                requestNewDataWithType(type: 8)
                print("NBA")
            case "gupiao":
                currentKeyStr = "gupiao"
                currentIndex = 9
                requestNewDataWithType(type: 9)
                print("gupiao")
            case "xingzuo":
                currentKeyStr = "xingzuo"
                currentIndex = 10
                requestNewDataWithType(type: 10)
                print("xingzuo")
            case "nvxing":
                currentKeyStr = "nvxing"
                currentIndex = 11
                requestNewDataWithType(type: 11)
                print("nvxing")
            case "jiankang":
                currentKeyStr = "nvxing"
                currentIndex = 12
                requestNewDataWithType(type: 12)
                print("jiankang")
            case "yuer":
                currentKeyStr = "yuer"
                currentIndex = 13
                requestNewDataWithType(type: 13)
                print("yuer")
            default:break
            
        }
    }
    
    func requestNewDataWithType(type : Int)  {
        print(typeAry[type])
        Alamofire.request("http://api.jisuapi.com/news/get",parameters: ["channel": typeAry[type],"appkey":"0a4d2c1f8257519d"]).responseJSON { response in
            
            //请求成功
            //as? NSDictionary 因为json被当做一个any类型 无法当做字典取值 所以 需要将any转换为字典类型  通过as  注意NSDictionary不能用Dictionary替换
            if let json = response.result.value as? NSDictionary {
                print("JSON: \(json)") // serialized json response
                if (json["status"] as! String != "0"){//请求有问题
                    TQYRTool.dismissLoadingImg(controller: self)
                    TQYRTool.showNodataImg(type: "wangluo", controller: self)
                    self.tableView.mj_header.endRefreshing()
                    self.page = 1
                    return
                }else{
                    TQYRTool.dismissNoDataImg(controller: self)
                }
                let resultDict = json["result"] as? NSDictionary
              self.listAry =  TQYRMainListModel.mj_objectArray(withKeyValuesArray: resultDict?["list"])
                self.tableView.reloadData()
                TQYRTool.dismissLoadingImg(controller: self)
                if(self.listAry.count == 0){
                    TQYRTool.showNodataImg(type: "shuju", controller: self)
                }else{
                    TQYRTool.dismissNoDataImg(controller: self)
                }
                print(self.listAry)
                self.tableView.mj_header.endRefreshing()
                self.page = 1
            }
        }
        
    }
    
    func pushToNewsDetailWithIndex(index : Int)  {
        let detailController : TQYRNewsDetailController = TQYRNewsDetailController.init()
        let model : TQYRMainListModel = self.listAry[index] as! TQYRMainListModel
        if model.url == "" {
            return
        }
        detailController.url = (model.url as NSString?)!
        detailController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    func loadMoreDataWithType(type : Int)  {
        Alamofire.request("http://api.jisuapi.com/news/get",parameters: ["channel": typeAry[type],"appkey":"0a4d2c1f8257519d","start":page*20]).responseJSON { response in
            //请求成功
            //as? NSDictionary 因为json被当做一个any类型 无法当做字典取值 所以 需要将any转换为字典类型  通过as  注意NSDictionary不能用Dictionary替换
            if let json = response.result.value as? NSDictionary {
                print("JSON: \(json)") // serialized json response
                if (json["status"] as! String != "0"){//请求有问题
                    TQYRTool.dismissLoadingImg(controller: self)
                    TQYRTool.showNodataImg(type: "wangluo", controller: self)
                    self.tableView.mj_footer.endRefreshing()
                    return
                }else{
                    TQYRTool.dismissNoDataImg(controller: self)
                }
                let resultDict = json["result"] as? NSDictionary
                let tempAry : NSArray =  TQYRMainListModel.mj_objectArray(withKeyValuesArray: resultDict?["list"])
                TQYRTool.dismissLoadingImg(controller: self)
                if(tempAry.count == 0){
                    TQYRTool.showNodataImg(type: "shuju", controller: self)
                }else{
                    TQYRTool.dismissNoDataImg(controller: self)
                    self.page += 1
                    self.listAry.addObjects(from: tempAry as! [Any])
                    self.tableView.reloadData()
                }
                print(self.listAry)
                self.tableView.mj_footer.endRefreshing()
            }
        }

    }
    
}
