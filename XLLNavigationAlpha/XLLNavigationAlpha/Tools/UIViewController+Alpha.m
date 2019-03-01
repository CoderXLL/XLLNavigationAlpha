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
    if (navAlpha < 1)
    {
        //必须满足这两个条件，导航根控制器顶部才能在导航栏底下
        //否则就没有意义了
        self.navigationController.navigationBar.translucent = YES;
        self.edgesForExtendedLayout = UIRectEdgeTop;
    }
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
    return titleColor;
}

- (void)setNavTitleColor:(UIColor *)navTitleColor
{
    objc_setAssociatedObject(self, @selector(navTitleColor), navTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName] = navTitleColor;
    dictM[NSFontAttributeName] = self.navTitleFont;
    [self.navigationController.navigationBar setTitleTextAttributes:dictM];
}

- (UIFont *)navTitleFont
{
    return objc_getAssociatedObject(self, @selector(navTitleFont));
}

- (void)setNavTitleFont:(NSFont *)navTitleFont
{
    objc_setAssociatedObject(self, @selector(navTitleFont), navTitleFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = navTitleFont;
    dictM[NSForegroundColorAttributeName] = self.navTitleColor;
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

- (NSString *)backImgName
{
    return objc_getAssociatedObject(self, @selector(backImgName));
}

- (void)setBackImgName:(NSString *)backImgName
{
    objc_setAssociatedObject(self, @selector(backImgName), backImgName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIView *leftView = self.navigationItem.leftBarButtonItem.customView;
    if (leftView && [leftView isKindOfClass:[UIButton class]])
    {
        UIButton *leftBtn = (UIButton *)leftView;
        [leftBtn setImage:[UIImage imageNamed:backImgName] forState:UIControlStateNormal];
    }
}

@end
