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
class TQYRMainTableViewController: UITableViewController {
    var keyStr = ""
    var currentKeyStr = "头条"
    let typeAry = ["头条","新闻","财经","体育","娱乐","军事","教育","科技","NBA","股票","星座","女性","健康","育儿"]
    var listAry :NSMutableArray = NSMutableArray.init()
    
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
            cell?.backgroundColor = UIColor.red
            cell?.textLabel?.text = String(indexPath.row)
            
            return cell!
        }else{
            let cell :  TQYRPicListTableViewCell = TQYRPicListTableViewCell.creatCellWithTableview(tableView: tableView)
            
            let model : TQYRMainListModel  = self.listAry[indexPath.row] as! TQYRMainListModel
            
//            cell.model = model
            cell.textLabel?.text = model.title
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        }else{
            return 225
        }
    }
    

    func reloadDataWithKeyString(keyStr :String) {
        switch keyStr {
            case "toutiao":
                currentKeyStr = "toutiao"
                requestNewDataWithType(type: 0)
                print("toutiao")
            case "xinwen":
                currentKeyStr = "xinwen"
                requestNewDataWithType(type: 1)
                print("xinwen")
            case "caijing":
                currentKeyStr = "caijing"
                requestNewDataWithType(type: 2)
                print("caijing")
            case "tiyu":
                currentKeyStr = "tiyu"
                requestNewDataWithType(type: 3)
                print("tiyu")
            case "yule":
                currentKeyStr = "yule"
                requestNewDataWithType(type: 4)
                print("yule")
            case "junshi":
                currentKeyStr = "junshi"
                requestNewDataWithType(type: 5)
                print("junshi")
            case "jiaoyu":
                currentKeyStr = "jiaoyu"
                requestNewDataWithType(type: 6)
                print("jiaoyu")
            case "keji":
                currentKeyStr = "keji"
                requestNewDataWithType(type: 7)
                print("keji")
            case "NBA":
                currentKeyStr = "NBA"
                requestNewDataWithType(type: 8)
                print("NBA")
            case "gupiao":
                currentKeyStr = "gupiao"
                requestNewDataWithType(type: 9)
                print("gupiao")
            case "xingzuo":
                currentKeyStr = "xingzuo"
                requestNewDataWithType(type: 10)
                print("xingzuo")
            case "nvxing":
                currentKeyStr = "nvxing"
                requestNewDataWithType(type: 11)
                print("nvxing")
            case "jiankang":
                currentKeyStr = "nvxing"
                requestNewDataWithType(type: 12)
                print("jiankang")
            case "yuer":
                currentKeyStr = "yuer"
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
            }
        }
        
    }
    
    

}
