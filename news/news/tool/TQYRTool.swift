//
//  TQYRTool.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/15.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit
import SDWebImage

class TQYRTool: NSObject {
    var loadingImgView : UIImageView  = UIImageView.init()
    var noDataImgView : UIImageView  = UIImageView.init()
    
   
    // swift 单粒
    static let instance: TQYRTool = TQYRTool()
    
    class func currenrTool() -> TQYRTool {
        
        return instance
    }
    
    //取消loading
    static func dismissLoadingImg(controller : UIViewController){
        TQYRTool.currenrTool().loadingImgView.removeFromSuperview()
    }
    //取消空态图
    static func dismissNoDataImg(controller : UIViewController){
        TQYRTool.currenrTool().noDataImgView.removeFromSuperview()
    }
    
    
    //加载loading
    static func showLoadingImg(controller : UIViewController){
    
        let loadingImgView : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: 120))
        TQYRTool.currenrTool().loadingImgView = loadingImgView
        
        loadingImgView.image = #imageLiteral(resourceName: "Oval")
        addRotationAnim(loadingImgView: loadingImgView)
        loadingImgView.center = CGPoint.init(x: controller.view.center.x, y: controller.view.center.y-90)

        controller.view.addSubview(loadingImgView)
        
    }
    
    
    //加载空态图
    static func showNodataImg(type:NSString,controller : UIViewController){
        
        let noDataImgView : UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 200))
        
        TQYRTool.currenrTool().noDataImgView = noDataImgView
        
        switch type {
        case "shuju":
            noDataImgView.image = #imageLiteral(resourceName: "nodata1")
        case "wangluo":
            noDataImgView.image = #imageLiteral(resourceName: "nodata2")
        default:
            noDataImgView.image = #imageLiteral(resourceName: "nodata3")
        }
        noDataImgView.center = CGPoint.init(x: controller.view.center.x, y: controller.view.center.y-80)
        
        controller.view.addSubview(noDataImgView)
    }
    
    
    //旋转动画
    static func addRotationAnim(loadingImgView:UIImageView) {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 0.8 //多长时间转一圈
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false
        
        // 3.将动画添加到layer中
        loadingImgView.layer.add(rotationAnim, forKey: nil)
    }
}
