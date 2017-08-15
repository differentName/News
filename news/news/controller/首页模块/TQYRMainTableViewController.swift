//
//  TQYRMainTableViewController.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/14.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit
import Alamofire
class TQYRMainTableViewController: UITableViewController {
    var keyStr = ""
    let typeAry = ["头条","新闻","财经","体育","娱乐","军事","教育","科技","NBA","股票","星座","女性","健康","育儿"]
    var listAry :NSMutableArray = NSMutableArray.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tool:TQYRTool = TQYRTool.init()
        tool.showLoadingImg(controller: self)
        reloadDataWithKeyString(keyStr: keyStr)
        requestNewDataWithType(type: 0)
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none

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
            return 1
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
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "TQYRPicListTableViewCell")  as? TQYRPicListTableViewCell
            if tableView.dequeueReusableCell(withIdentifier: "TQYRPicListTableViewCell") == nil {
                cell = Bundle.main.loadNibNamed("TQYRPicListTableViewCell", owner: self, options: nil)?.first as? TQYRPicListTableViewCell
            }
            let model : TQYRMainListModel  = self.listAry[indexPath.row] as! TQYRMainListModel
            
            cell?.title.text = model.title
            
            return cell!
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
                requestNewDataWithType(type: 0)
                print("toutiao")
            case "xinwen":
                requestNewDataWithType(type: 1)
                print("xinwen")
            case "caijing":
                requestNewDataWithType(type: 2)
                print("caijing")
            case "tiyu":
                requestNewDataWithType(type: 3)
                print("tiyu")
            case "yule":
                requestNewDataWithType(type: 4)
                print("yule")
            case "junshi":
                requestNewDataWithType(type: 5)
                print("junshi")
            case "jiaoyu":
                requestNewDataWithType(type: 6)
                print("jiaoyu")
            case "keji":
                requestNewDataWithType(type: 7)
                print("keji")
            case "NBA":
                requestNewDataWithType(type: 8)
                print("NBA")
            case "gupiao":
                requestNewDataWithType(type: 9)
                print("gupiao")
            case "xingzuo":
                requestNewDataWithType(type: 10)
                print("xingzuo")
            case "nvxing":
                requestNewDataWithType(type: 11)
                print("nvxing")
            case "jiankang":
                requestNewDataWithType(type: 12)
                print("jiankang")
            case "yuer":
                requestNewDataWithType(type: 13)
                print("yuer")
            default:break
            
        }
    }
    
    func requestNewDataWithType(type : Int)  {
        Alamofire.request("http://api.jisuapi.com/news/get",parameters: ["channel": typeAry[type],"appkey":"0a4d2c1f8257519d"]).responseJSON { response in
            
            //请求成功
            //as? NSDictionary 因为json被当做一个any类型 无法当做字典取值 所以 需要将any转换为字典类型  通过as  注意NSDictionary不能用Dictionary替换
            if let json = response.result.value as? NSDictionary {
                print("JSON: \(json)") // serialized json response
                
                let resultDict = json["result"] as? NSDictionary
              self.listAry =  TQYRMainListModel.mj_objectArray(withKeyValuesArray: resultDict?["list"])
                self.tableView.reloadData()
                print(self.listAry)
            }
        }
        
    }
    
    

}
