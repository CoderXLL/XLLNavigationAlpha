//
//  UIImage+XLL.h
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/2.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XLL)

/**
 根据颜色获取一个纯色的图片
 
 @param color 颜色
 @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
