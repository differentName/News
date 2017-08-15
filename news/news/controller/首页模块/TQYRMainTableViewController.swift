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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadDataWithKeyString(keyStr: keyStr)
        requestNewDataWithType(type: 0)

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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "reuseIdentifier")
        }
        cell?.backgroundColor = UIColor.red
        cell?.textLabel?.text = String(indexPath.row)

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
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
            if let json = response.result.value as? NSDictionary {
                print("JSON: \(json)") // serialized json response
                let resultDict = json["result"] as? NSDictionary
              let listAry =  TQYRMainListModel.mj_objectArray(withKeyValuesArray: resultDict?["list"])
                print(listAry)
            }
        }
        
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }
    
    

}
