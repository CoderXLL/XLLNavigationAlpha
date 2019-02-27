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
 @discussion 在viewDidLoad:中设置
 */
@property (nonatomic, assign) CGFloat navAlpha;

/**
 自定义返回按钮背景资源名
 @discussion 在viewDidLoad:中设置
 */
@property (nonatomic, copy) NSString *backImgName;

/**
 当前控制器导航栏标题颜色
 @discussion 在viewWillAppear:中设置
 */
@property (nonatomic, strong) UIColor *navTitleColor;

/**
 当前控制器导航栏标题大小
 @discussion 在viewWillAppear:中设置
 */
@property (nonatomic, strong) UIFont *navTitleFont;

/**
 当前控制器导航栏tintColor
 @discussion 在viewDidLoad:中设置
 */
@property (nonatomic, strong) UIColor *navTintColor;

/**
 当前控制器导航栏barTintColor
 */
@property (nonatomic, strong) UIColor *navBarTintColor __attribute__((deprecated("内部实现出现问题，暂不使用")));

@end
