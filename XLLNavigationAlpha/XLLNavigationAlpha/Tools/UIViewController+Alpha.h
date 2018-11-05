//
//  UIViewController+Alpha.h
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/1.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alpha)

/**
 当前控制器导航栏透明度
 */
@property (nonatomic, assign) CGFloat navAlpha;

/**
 当前控制器导航栏tintColor
 */
@property (nonatomic, strong) UIColor *navTintColor;

/**
 当前控制器导航栏标题颜色
 */
@property (nonatomic, strong) UIColor *navTitleColor __attribute__((deprecated("内部实现出现问题，暂不使用")));

/**
 当前控制器导航栏标题大小
 */
@property (nonatomic, assign) CGFloat navTitleFont __attribute__((deprecated("内部实现出现问题，暂不使用")));

/**
 当前控制器导航栏barTintColor
 */
@property (nonatomic, strong) UIColor *navBarTintColor;

@end
