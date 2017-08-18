//
//  TQYRMainListModel.m
//  news
//
//  Created by 高增洪 on 2017/8/15.
//  Copyright © 2017年 天桥艺人. All rights reserved.
//

#import "TQYRMainListModel.h"

@implementation TQYRMainListModel
- (void)setContent:(NSString *)content{
    _content = content;
    NSString *htmlStr = [self filterHTML:content];
    if (htmlStr.length >= 100) {
        _shortContent = [htmlStr substringToIndex:100];
    }else{
        _shortContent = htmlStr;
    }
}


//屏蔽html中的符号
-(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return [html substringFromIndex:4];
}
@end
