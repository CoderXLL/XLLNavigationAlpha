//
//  XLLNavigationController.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/2.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "XLLNavigationController.h"
#import "UIImage+XLL.h"

@interface XLLNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation XLLNavigationController

+ (void)initialize
{
    // 所有navigationbar
    //    UINavigationBar *navigationBar = [UINavigationBar appearance];
    // 本类navigationbar
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
//    UIImage *barImage = [UIImage imageWithColor:[UIColor redColor]];
//    [navigationBar setBackgroundImage:barImage forBarMetrics:UIBarMetricsDefault];
    [navigationBar setBarTintColor:[UIColor blueColor]];
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)]) {
        [navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    }
//    // 统一修改控制器title的字体颜色
//    NSMutableDictionary* dictM = [NSMutableDictionary dictionary];
//    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17.0];
//    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    [navigationBar setTitleTextAttributes:dictM];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    id tagart = self.interactivePopGestureRecognizer.delegate;
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:tagart action:@selector(handleNavigationTransition:)];
//    [self.view addGestureRecognizer:pan];
//    // 设置手势的代理
//    pan.delegate = self;
//    // 禁能系统的手势
//    self.interactivePopGestureRecognizer.enabled = NO;
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//        return YES;
//}
//
//// 手势的代理方法
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
