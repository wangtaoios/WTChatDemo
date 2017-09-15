//
//  NSString+WTExtension.m
//  CatEyeInternet
//
//  Created by wangtao on 16/5/25.
//  Copyright © 2016年 wwcj. All rights reserved.
//

#import "NSString+WTExtension.h"

@implementation NSString (WTExtension)


- (CGFloat)wt_calculateStringWidthWithFontOfSize:(CGFloat)fontOfSize
{
    NSDictionary *attributes = @{
                                 NSFontAttributeName : WTFontSize(fontOfSize)
                                 };
    CGSize size = [self sizeWithAttributes:attributes];
    return ceilf(size.width);
}

- (CGSize)wt_calculateStringSizeWithFontOfSize:(CGFloat)fontOfSize maxWidth:(CGFloat)maxWidth
{
    CGSize textMaxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attribute = @{
                                NSFontAttributeName:WTFontSize(fontOfSize),
                                NSParagraphStyleAttributeName:paragraphStyle
                                };
    
    CGRect size = [self boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    return size.size;
}



@end
