//
//  XLLHeadView.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/2.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "XLLHeadView.h"

@implementation XLLHeadView

+ (instancetype)xibView
{
    return [[NSBundle mainBundle] loadNibNamed:@"XLLHeadView" owner:nil options:nil].firstObject;
}

@end
