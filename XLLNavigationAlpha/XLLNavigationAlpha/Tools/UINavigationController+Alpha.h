//
//  UINavigationController+Alpha.h
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/1.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

//使用本sdk,自定义的UINavigationController如果想使用UINavigationBarDelegate中的代理方法，请在代理方法前加上"alpha_"

#import <UIKit/UIKit.h>

@interface UINavigationController (Alpha)

- (void)setNavigationBackgroundAlpha:(CGFloat)alpha;

@end
