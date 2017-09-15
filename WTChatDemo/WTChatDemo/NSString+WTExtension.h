//
//  NSString+WTExtension.h
//  CatEyeInternet
//
//  Created by wangtao on 16/5/25.
//  Copyright © 2016年 wwcj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WTExtension)

- (CGFloat)wt_calculateStringWidthWithFontOfSize:(CGFloat)fontOfSize;

- (CGSize)wt_calculateStringSizeWithFontOfSize:(CGFloat)fontOfSize maxWidth:(CGFloat)maxWidth;

@end
