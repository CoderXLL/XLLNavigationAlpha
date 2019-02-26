//
//  XLLNextController.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/2.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "XLLNextController.h"
#import "UIViewController+Alpha.h"

@interface XLLNextController ()

@end

@implementation XLLNextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navAlpha = (self.signRow%2==0)?1:0;
    self.backImgName = (self.signRow%2==0)?@"back_normal_white":@"back_normal";
    self.navTintColor = [UIColor redColor];
    
    self.title = @"最后一页";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navTitleFont = [UIFont boldSystemFontOfSize:18];
    self.navTitleColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
