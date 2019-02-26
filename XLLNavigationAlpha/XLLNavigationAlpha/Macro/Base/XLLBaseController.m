//
//  XLLBaseController.m
//  XLLNavigationAlpha
//
//  Created by xiaoll on 2019/2/25.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

#import "XLLBaseController.h"

@interface XLLBaseController () <UIGestureRecognizerDelegate>

@end

@implementation XLLBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLeftBarItem:@selector(onBack:) image:@"back_normal" highlightedImage:@"back_normal"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    return YES;
//}

- (IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setLeftBarItem:(SEL)selector image:(NSString*)strImagePathNormarl highlightedImage:(NSString*)strImagePathHighlighted
{
    //设置leftBarButtonItem
    UIButton *leftBarBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 47, 44)];
    [leftBarBtn setImage:[UIImage imageNamed:strImagePathNormarl] forState:UIControlStateNormal];
    [leftBarBtn setImage:[UIImage imageNamed:strImagePathHighlighted] forState:UIControlStateHighlighted];
    [leftBarBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    leftBarBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftBarBtn.imageEdgeInsets = UIEdgeInsetsMake(9, 0, 9, 5);
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarBtn];
    self.navigationItem.leftBarButtonItem = buttonItem;
}

@end
