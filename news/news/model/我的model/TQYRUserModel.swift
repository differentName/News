//
//  TQYRUserModel.swift
//  news
//
//  Created by 天桥艺人 on 2017/8/22.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

import UIKit

class TQYRUserModel: NSObject {
    var isLogin = false
    
    // swift 单粒
    static let instance: TQYRUserModel = TQYRUserModel()
    
    class func currentUser() -> TQYRUserModel {
        
        return instance
    }
    
}
