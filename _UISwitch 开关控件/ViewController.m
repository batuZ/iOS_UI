//
//  ViewController.m
//  _UISwitch 开关控件
//
//  Created by 张智 on 2018/8/5.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void) switchChanged:(UISwitch*)swc{
    if(swc.on)
    {
        self.view.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    //在视图中，通过tag值，获取目标对象
    UISwitch* swc = [self.view viewWithTag:144];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _swc = [[UISwitch alloc] init];
    
    //UISWitch的大小是固定的，所以size设置对其无效
    _swc.frame = CGRectMake(100, 100, 0, 0);
    
    //设置状态,是否动画
    [_swc setOn:YES animated:YES];
    _swc.on = YES;
    
    //添加事件
    //action:@selector(switchChanged:) 一个带参的事件，参数就是switch对象
    //forControlEvents:UIControlEventValueChanged 控件发生变化时
    [_swc addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_swc];
    
    _swc.tag = 144;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
