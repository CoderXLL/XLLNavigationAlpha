//
//  UINavigationController+Alpha.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/1.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "UINavigationController+Alpha.h"
#import <objc/runtime.h>
#import "UIViewController+Alpha.h"

@interface UINavigationController () <UINavigationBarDelegate>


@end

@implementation UINavigationController (Alpha)

+ (void)load
{
    NSArray *arr = @[@"_updateInteractiveTransition:",@"popToViewController:animated:",@"popToRootViewControllerAnimated:",@"setDelegate:"];
    for (NSString *methodStr in arr) {
        
        NSString *newMethodStr = [[@"xll_" stringByAppendingString:methodStr] stringByReplacingOccurrencesOfString:@"__" withString:@"_"];
        Method method = class_getInstanceMethod(self, NSSelectorFromString(methodStr));
        Method newMethod = class_getInstanceMethod(self, NSSelectorFromString(newMethodStr));
        method_exchangeImplementations(method, newMethod);
    }
}

#pragma mark - new method
//拖动手势进度
- (void)xll_updateInteractiveTransition:(CGFloat)percentComplete
{
    UIViewController *topVC = self.topViewController;
    if (!topVC) return;
    //1.获取转场上下文协议
    id <UIViewControllerTransitionCoordinator>transitionCtx = topVC.transitionCoordinator;
    //2.根据转场上下文协议获取转场始末控制器
    UIViewController *fromVC = [transitionCtx viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionCtx viewControllerForKey:UITransitionContextToViewControllerKey];
    //3.获取始末控制器导航栏透明度
    CGFloat fromAlpha = fromVC.navAlpha;
    CGFloat toAlpha = toVC.navAlpha;
    //4.计算出转场过程中变化的透明度值
    CGFloat newAlpha = fromAlpha+(toAlpha-fromAlpha)*percentComplete;
    //5.重新设定透明度
    [self setNavigationBackgroundAlpha:newAlpha];
    //6.设置转场中的tintColor
    UIColor *fromTintColor = fromVC.navTintColor;
    UIColor *toTintColor = toVC.navTintColor;
    self.navigationBar.tintColor = [self getCurrentColor:fromTintColor toColor:toTintColor percentComplete:percentComplete];
    [self xll_updateInteractiveTransition:percentComplete];
}

- (NSArray<UIViewController *> *)xll_popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self setNavigationBackgroundAlpha:viewController.navAlpha];
    self.navigationBar.tintColor = viewController.navTintColor;
    return [self xll_popToViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)xll_popToRootViewControllerAnimated:(BOOL)animated
{
    [self setNavigationBackgroundAlpha:self.viewControllers.firstObject.navAlpha];
    self.navigationBar.tintColor = self.viewControllers.firstObject.navTintColor;
    return [self xll_popToRootViewControllerAnimated:animated];
}

#pragma mark - private method
- (UIColor *)getCurrentColor:(UIColor *)fromColor toColor:(UIColor *)toColor percentComplete:(CGFloat)percentComplete
{
    CGFloat fromRed = 0;
    CGFloat fromGreen = 0;
    CGFloat fromBlue = 0;
    CGFloat fromAlpha = 0;
    [fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    
    CGFloat toRed = 0;
    CGFloat toGreen = 0;
    CGFloat toBlue = 0;
    CGFloat toAlpha = 0;
    [toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    
    CGFloat newRed = fromRed+(toRed-fromRed)*percentComplete;
    CGFloat newGreen = fromGreen+(toGreen-fromGreen)*percentComplete;
    CGFloat newBlue = fromBlue+(toBlue-fromBlue)*percentComplete;
    CGFloat newAlpha = fromAlpha+(toAlpha-fromAlpha)*percentComplete;
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}


- (void)dealInteractionChanges:(id <UIViewControllerTransitionCoordinatorContext>)context
{
    void(^animations)(NSString *) = ^(NSString *key) {
      
        CGFloat nowAlpha = [context viewControllerForKey:key].navAlpha;
        [self setNavigationBackgroundAlpha:nowAlpha];
        self.navigationBar.tintColor = [context viewControllerForKey:key].navTintColor;
    };
    if (context.isCancelled) {
        
        //拖动取消，使用toVC的属性相关
        NSTimeInterval cancaleDuration = context.transitionDuration * context.percentComplete;
        [UIView animateWithDuration:cancaleDuration animations:^{
            animations(UITransitionContextFromViewControllerKey);
        }];
    } else {
        
        //正常拖动，使用fromVC的属性相关
        NSTimeInterval finishDuration = context.transitionDuration * (1 - context.percentComplete);
        [UIView animateWithDuration:finishDuration animations:^{
            animations(UITransitionContextToViewControllerKey);
        }];
    }
}

#pragma mark - public method
- (void)setNavigationBackgroundAlpha:(CGFloat)alpha
{
    //1.找到导航bar上第一个背景视图
    UIView *barView = [[self.navigationBar subviews] firstObject];
    //2.kvc获取阴影视图
    UIView *shadowView = [barView valueForKey:@"_shadowView"];
    //3.如果能够获取到设置透明度
    if (shadowView) {
        shadowView.alpha = alpha;
    }
    //4.如果导航栏默认没有设置半透明,背景视图透明度也进行改变
    if (!self.navigationBar.isTranslucent) {
        barView.alpha = alpha;
        return;
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        
        UIView *backEffectView = [barView valueForKey:@"_backgroundEffectView"];
        if (backEffectView && [self.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault] == nil) {
            
            backEffectView.alpha = alpha;
        }
    } else {
        
        UIView *daptiveBackdrop = [barView valueForKey:@"_adaptiveBackdrop"];
        UIView *backdropEffectView = [daptiveBackdrop valueForKey:@"_backdropEffectView"];
        if (daptiveBackdrop != nil && backdropEffectView != nil ) {
            backdropEffectView.alpha = alpha;
        }
    }
}

#pragma mark - UINavigationBarDelegate
//这里主要处理手势转场取消的情况
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    UIViewController *topVC = self.topViewController;
    id <UIViewControllerTransitionCoordinator> transitionCtx = topVC.transitionCoordinator;
    if (topVC && transitionCtx && transitionCtx.initiallyInteractive) {
        
        if ([[UIDevice currentDevice].systemVersion floatValue]>=10.0) {
            
            [transitionCtx notifyWhenInteractionChangesUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                
                [self dealInteractionChanges:context];
            }];
        } else {
            
            [transitionCtx notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                
                [self dealInteractionChanges:context];
            }];
        }
        return YES;
    }
    int n = self.viewControllers.count >= navigationBar.items.count ? 2 : 1;
    UIViewController *popToVc = self.viewControllers[self.viewControllers.count - n];
    [self popToViewController:popToVc animated:YES];
    return YES;
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item
{
    [self setNavigationBackgroundAlpha:self.topViewController.navAlpha];
    self.navigationBar.tintColor = self.topViewController.navTintColor;
    return YES;
}


@end