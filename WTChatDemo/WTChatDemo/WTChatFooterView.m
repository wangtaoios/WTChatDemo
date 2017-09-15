//
//  WTChatFooterView.m
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import "WTChatFooterView.h"

@interface WTChatFooterView () <UITextFieldDelegate>

@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, weak) UIView *line;

@end


@implementation WTChatFooterView

@synthesize isFirst = _isFirst;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = kWhiteColor;
        [self setupAll];
    }
    return self;
}

- (void)setupAll
{
    self.contentView.backgroundColor = WTHexColor(0xf2f2f2);
    
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = kWhiteColor;
    [self.contentView addSubview:textField];
    textField.delegate = self;
    self.textField = textField;
    textField.layer.cornerRadius = 3;
    textField.layer.masksToBounds = YES;
    
    textField.returnKeyType = UIReturnKeySend;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageState:) name:kMessageState object:nil];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = WTHexColor(0xdddddd);
    [self.contentView addSubview:line];
    self.line = line;
    
}

- (void)messageState:(NSNotification *)noti
{
    NSInteger state = [[noti object] boolValue];
    if (state) {
        [self.textField resignFirstResponder];
        if (self.resignFirstRes) {
            self.resignFirstRes();
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length > 0) {
        if (self.clickSenderText) {
            self.clickSenderText(self.textField.text);
        }
        return YES;
    }
    return NO;
}

- (void)setIsFirst:(BOOL)isFirst
{
    _isFirst = isFirst;
    if (isFirst) {
        [self.textField becomeFirstResponder];
    } else {
        [self.textField resignFirstResponder];
    }
}

- (BOOL)isFirst
{
    if ([self.textField isFirstResponder]) {
        return YES;
    }
    return NO;
}

- (void)setSendSucceed:(BOOL)sendSucceed
{
    self.textField.text = @"";
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat padding = 10;
    
    self.textField.frame = CGRectMake(padding, padding, self.wt_width - padding * 2, self.wt_height - padding * 2);
    
    self.line.frame = CGRectMake(0, 0, self.wt_width, .5);
    
    
}


@end
