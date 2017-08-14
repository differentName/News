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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadDataWithKeyString(keyStr: keyStr)

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
        Alamofire.request("http://v.juhe.cn/toutiao/index?type=top&key=560826219329573c61c656749023c327").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    


    func reloadDataWithKeyString(keyStr :String) {
        switch keyStr {
            case "toutiao":
                print("toutiao")
            case "yule":
                print("yule")
            case "tiyu":
                print("tiyu")
            case "caijing":
                print("caijing")
            case "keji":
                print("keji")
            case "qiche":
                print("qiche")
            case "shehui":
                print("shehui")
            case "junshi":
                print("junshi")
            case "shishang":
                print("shishang")
            case "fangchan":
                print("fangchan")
            case "lishi":
                print("lishi")
            case "jiaju":
                print("jiaju")
            case "jiankang":
                print("jiankang")
            default:break
            
        }
    }

}
