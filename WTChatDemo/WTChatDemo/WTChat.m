//
//  WTChat.m
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import "WTChat.h"

@implementation WTChat


+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"wdid" : @"id"};
}


- (CGFloat)commentW
{
    if (_commentW == 0) {
        _commentW = [self.comment wt_calculateStringWidthWithFontOfSize:13] + 2 * kPadding;
        if (_commentW > (kMainScreenWidth / 2 + 2 * kPadding)) {
            _commentW = (kMainScreenWidth / 2 + 2 * kPadding);
        }
    }
    return _commentW;
}

- (CGFloat)commentH
{
    if (_commentH == 0) {
        CGFloat textH = [self.comment wt_calculateStringSizeWithFontOfSize:13 maxWidth:kMainScreenWidth / 2].height;
        // 一行字体是15高，一行的情况就和头像一样高
        _commentH = (textH < 20) ? 35 : (textH + 20);
        
    }
    return _commentH;
}

- (CGFloat)height
{
    if (_height == 0) {
        _height = self.commentH + 20;
        if ([self.isShow isEqualToString:@"1"]) {
            _height += 20;
        }
        
    }
    return _height;
}


@end
