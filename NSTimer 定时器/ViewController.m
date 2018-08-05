//
//  ViewController.m
//  NSTimer 定时器
//
//  Created by 张智 on 2018/8/5.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//Button事件
-(void)startButPress{
    //初始化并启动计时器
    self.timer = [NSTimer
                  scheduledTimerWithTimeInterval:1    //  触发时间间隔
                  target:self                         //  事件拥有者
                  selector:@selector(TimerUpdate:)     //  事件函数
                  userInfo:@"Time:" //事件可以带一个Timer参数，通过Timer.userInfo获取传入的值
                  repeats:YES];                       //  是否重复触发
}
//Button事件
-(void)stopButPress{
    //停止计时器
    [self.timer invalidate];
}
//TimerUPdate事件
-(void)TimerUpdate:(NSTimer*)timer{
    _lab.text =[NSString stringWithFormat:@"%@ %@",timer.userInfo, [NSDate date]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //显示Lable
    _lab = [[UILabel alloc]init];
    _lab.frame = CGRectMake(40, 100, 300, 60);
    _lab.text = @"fffff";
    [self.view addSubview:_lab];
    //开始按钮
    UIButton* startBT = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startBT.frame = CGRectMake(100, 200, 100, 40);
    [startBT setTitle:@"开始" forState:UIControlStateNormal];
    [startBT addTarget:self action:@selector(startButPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBT];
    //停止按钮
    UIButton* stopTB = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopTB.frame = CGRectMake(100, 300, 100, 40);
    [stopTB setTitle:@"停止" forState:UIControlStateNormal];
    [stopTB addTarget:self action:@selector(stopButPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopTB];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
