//
//  UIImageView+WTExtension.h
//  CatEyeInternet
//
//  Created by wangtao on 16/5/25.
//  Copyright © 2016年 wwcj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WTExtension)

/**
 *  自定义占位，无圆角
 */
- (void)wt_setImageWithUrlString:(NSString *)urlString
               placeholderString:(NSString *)placeholderString;

@end
