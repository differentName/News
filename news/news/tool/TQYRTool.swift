//
//  TQYRTool.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/15.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit

class TQYRTool: NSObject {
    open func showLoadingImg(controller : UIViewController){
        let loadingImgView : UIImageView = UIImageView.init(image: #imageLiteral(resourceName: "loading.gif"))
//        // 读取gif图片数据 注意:传入nil参数可能有警告
//        NSData *data = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"001" ofType:@"gif"]];
//        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,200,200)];
//        [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
        
        loadingImgView.center = controller.view.center
        controller.view.addSubview(loadingImgView)
    }

}
