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
    self.navTintColor = [UIColor redColor];
    
    self.title = @"最后一页";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
