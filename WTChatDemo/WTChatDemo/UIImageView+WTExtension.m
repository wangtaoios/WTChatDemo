//
//  UIImageView+WTExtension.m
//  CatEyeInternet
//
//  Created by wangtao on 16/5/25.
//  Copyright © 2016年 wwcj. All rights reserved.
//

#import "UIImageView+WTExtension.h"
#import <YYWebImage/YYWebImage.h>


@implementation UIImageView (WTExtension)

/**
 *  自定义占位，无圆角
 */
- (void)wt_setImageWithUrlString:(NSString *)urlString
               placeholderString:(NSString *)placeholderString
{
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    
    [self yy_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseImageUrl, urlString]]
                 placeholder:[UIImage imageNamed:placeholderString]
                     options:YYWebImageOptionShowNetworkActivity
                  completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                  }];
}

@end
