//
//  TQYRMainListModel.h
//  news
//
//  Created by 高增洪 on 2017/8/15.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TQYRMainListModel : NSObject
/**频道**/
@property (copy, nonatomic) NSString *channel;
/**标题**/
@property (copy, nonatomic) NSString *title;
/**时间**/
@property (copy, nonatomic) NSString *time;
/**来源**/
@property (copy, nonatomic) NSString *src;
/**分类**/
@property (copy, nonatomic) NSString *category;
/**图片**/
@property (copy, nonatomic) NSString *pic;
/**内容**/
@property (copy, nonatomic) NSString *content;
/**内容**/
@property (copy, nonatomic) NSString *shortContent;
/**原文手机网址**/
@property (copy, nonatomic) NSString *url;
/**原文PC网址**/
@property (copy, nonatomic) NSString *weburl;
/**数量**/
@property (assign, nonatomic) int num;

@end
