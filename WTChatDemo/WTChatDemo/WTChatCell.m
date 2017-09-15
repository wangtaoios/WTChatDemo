//
//  WTChatCell.m
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import "WTChatCell.h"
#import "WTChat.h"


@interface WTChatCell ()

@property (nonatomic, weak) UILabel *time;
@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UILabel *detail;

@property (nonatomic, weak) UIView *baseView;

@end

@implementation WTChatCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.contentView.backgroundColor = kWhiteColor;
        
        [self setupAll];
    }
    return self;
}

- (void)setupAll
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor = WTHexColor(0xeaeaea);
    self.contentView.backgroundColor = WTHexColor(0xeaeaea);
    
    UILabel *time = [[UILabel alloc] init];
    time.textColor = WTHexColor(0xaaaaaa);
    time.textAlignment = NSTextAlignmentCenter;
    time.font = WTFontSize(12);
    
    [self.contentView addSubview:time];
    self.time = time;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [self.contentView addSubview:icon];
    self.icon = icon;
    self.icon.layer.cornerRadius = 35 / 2;
    self.icon.layer.masksToBounds = YES;
    
    UIView *baseView = [[UIView alloc] init];
    [self.contentView addSubview:baseView];
    self.baseView = baseView;
    baseView.layer.masksToBounds = YES;
    baseView.layer.cornerRadius = 4;
    
    UILabel *detail = [[UILabel alloc] init];
    detail.textColor = kBlackColor;
    detail.textAlignment = NSTextAlignmentLeft;
    detail.font = WTFontSize(13);    
    [baseView addSubview:detail];
    self.detail = detail;
    detail.numberOfLines = 0;
    
}

- (void)setModel:(WTChat *)model
{
    _model = model;
    
    if ([model.isShow isEqualToString:@"1"]) {
        self.time.text = model.addTime;
        self.time.hidden = NO;
        self.time.frame = CGRectMake(0, 0, kMainScreenWidth, 20);
        
    } else {
        self.time.text = @"";
        self.time.hidden = YES;
        self.time.frame = CGRectZero;
        
    }
    
    self.time.text = model.addTime;
    [self.icon wt_setImageWithUrlString:model.headImg placeholderString:@"me_icon"];
    self.detail.text = model.comment;
    
//    if (![model.userId isEqualToString:[WTAccount shareAccount].uid]) {
    
    if ([model.realName isEqualToString:@"西开金服官方"]) {
        self.detail.textColor = kBlackColor;
        self.baseView.backgroundColor = kWhiteColor;
        
        self.icon.frame = CGRectMake(kPadding, self.time.wt_bottom + kPadding, 35, 35);
        self.baseView.frame = CGRectMake(self.icon.wt_right + kPadding, self.icon.wt_top, model.commentW, model.commentH);
        self.detail.frame = CGRectMake(kPadding, kPadding, model.commentW - kPadding * 2, model.commentH - kPadding * 2);
        
    } else {
        self.detail.textColor = kWhiteColor;
        self.baseView.backgroundColor = kHomeColor;
        
        self.icon.frame = CGRectMake(kMainScreenWidth - 35 - kPadding, self.time.wt_bottom + kPadding, 35, 35);
        self.baseView.frame = CGRectMake(self.icon.wt_left - kPadding - model.commentW, self.icon.wt_top, model.commentW, model.commentH);
        self.detail.frame = CGRectMake(kPadding, kPadding, model.commentW - kPadding * 2, model.commentH - kPadding * 2);
        
    }
    
}



@end
