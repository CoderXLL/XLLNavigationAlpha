//
//  UIViewController+Alpha.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/1.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "UIViewController+Alpha.h"
#import <objc/runtime.h>
#import "UINavigationController+Alpha.h"

@implementation UIViewController (Alpha)

#pragma mark - setter, getter
- (CGFloat)navAlpha
{
    return [objc_getAssociatedObject(self, @selector(navAlpha)) floatValue];
}

- (void)setNavAlpha:(CGFloat)navAlpha
{
    objc_setAssociatedObject(self, @selector(navAlpha), @(navAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController setNavigationBackgroundAlpha:navAlpha];
}

- (UIColor *)navTintColor
{
    UIColor *tintColor = objc_getAssociatedObject(self, @selector(navTintColor));
    return tintColor?tintColor:[UIColor blackColor];
}

- (void)setNavTintColor:(UIColor *)navTintColor
{
    objc_setAssociatedObject(self, @selector(navTintColor), navTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.navigationController.navigationBar.tintColor = navTintColor;
}

- (UIColor *)navTitleColor
{
    UIColor *titleColor = objc_getAssociatedObject(self, @selector(navTitleColor));
   UIColor *getColor = self.navigationController.navigationBar.titleTextAttributes[NSForegroundColorAttributeName];
    return titleColor?titleColor:getColor;
}

- (void)setNavTitleColor:(UIColor *)navTitleColor
{
    objc_setAssociatedObject(self, @selector(navTitleColor), navTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName] = navTitleColor;
    [self.navigationController.navigationBar setTitleTextAttributes:dictM];
}

- (CGFloat)navTitleFont
{
    CGFloat titleFont = [objc_getAssociatedObject(self, @selector(navTitleFont)) floatValue];
    return titleFont>0?titleFont:17.0;
}

- (void)setNavTitleFont:(CGFloat)navTitleFont
{
    objc_setAssociatedObject(self, @selector(navTitleFont), @(navTitleFont), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:navTitleFont];
    [self.navigationController.navigationBar setTitleTextAttributes:dictM];
}

- (UIColor *)navBarTintColor
{
    UIColor *barTintColor = objc_getAssociatedObject(self, @selector(navBarTintColor));
    return barTintColor?barTintColor:[UIColor blackColor];
}

- (void)setNavBarTintColor:(UIColor *)navBarTintColor
{
    objc_setAssociatedObject(self, @selector(navBarTintColor), navBarTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.navigationController.navigationBar.barTintColor = navBarTintColor;
}

@end
