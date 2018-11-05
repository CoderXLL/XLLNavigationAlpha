//
//  ViewController.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/1.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Alpha.h"

@interface ViewController ()
{
    BOOL _isAnimation;
    CGFloat angle;
}

@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navAlpha = 1.0;
    self.navTintColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!_isAnimation) {
       
        _isAnimation = YES;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
        animation.duration = 5.0;
        animation.cumulative = YES;
        animation.repeatCount = HUGE_VALF;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        self.testBtn.imageView.layer.speed = 1;
        [self.testBtn.imageView.layer addAnimation:animation forKey:@"rotationAnimation"];
    } else {
        
        //1.取出当前时间，转成动画暂停的时间
        CFTimeInterval pauseTime = [self.testBtn.imageView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        //2.设置动画的时间偏移量，指定时间偏移量的目的是让动画定格在该时间点的位置
        self.testBtn.imageView.layer.timeOffset = pauseTime;
        //3.将动画的运行速度设置为0， 默认的运行速度是1.0
        self.testBtn.imageView.layer.speed = 0;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
