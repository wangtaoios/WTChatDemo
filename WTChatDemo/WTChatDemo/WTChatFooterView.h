//
//  WTChatFooterView.h
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickSender_t)(NSString *text);

typedef void(^ResignFirstResponder)();

@interface WTChatFooterView : UITableViewHeaderFooterView

@property (nonatomic, copy) ClickSender_t clickSenderText;
@property (nonatomic, copy) ResignFirstResponder resignFirstRes;

@property (nonatomic, assign) BOOL isFirst;
@property (nonatomic, assign) BOOL sendSucceed;

@end
