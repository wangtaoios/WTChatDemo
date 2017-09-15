//
//  WTChat.h
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTChat : NSObject

@property (nonatomic, copy) NSString *wdid;

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *headImg;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *isShow;
@property (nonatomic, copy) NSString *addTime;


@property (nonatomic, assign) CGFloat commentW;
@property (nonatomic, assign) CGFloat commentH;
@property (nonatomic, assign) CGFloat height;

@end
