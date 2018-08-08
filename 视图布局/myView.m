//
//  myView.m
//  视图布局
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "myView.h"

@implementation myView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _myBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _myBt.frame = CGRectMake(100, 160, 100, 40);
        _myBt.backgroundColor = [UIColor orangeColor];
        [_myBt setTitle:@"layout_Test" forState:UIControlStateNormal];
        [self addSubview:_myBt];
        self.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    }
    return self;
}

//当self发生布局变化时调用
-(void) layoutSubviews{
    [UIView beginAnimations:nil context:nil];
    
    _myBt.frame = CGRectMake(self.frame.size.width-100, self.frame.size.height-40, 100, 40);
    
    [UIView commitAnimations];
}

@end
