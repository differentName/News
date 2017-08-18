//
//  TQYRNewsDetailController.swift
//  news
//
//  Created by 高增洪 on 2017/8/18.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit

class TQYRNewsDetailController: UIViewController ,UIWebViewDelegate{

    @IBOutlet weak var webView: UIWebView!
    
    var url : NSString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TQYRTool.showLoadingImg(controller: self)
        
        self.webView.loadRequest(URLRequest.init(url: URL.init(string: url as String)!))
        self.title = "资讯详情"
        
        //swift中的方法选择器selector  不是@selector而是#selector
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "back"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        TQYRTool.dismissLoadingImg(controller: self)
    }
}
