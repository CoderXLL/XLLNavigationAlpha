//
//  UIImage+XLL.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/2.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "UIImage+XLL.h"

@implementation UIImage (XLL)

// 根据颜色获取一个纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
