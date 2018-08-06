//
//  ViewController.m
//  _UIStepper 步进器
//
//  Created by 张智 on 2018/8/6.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)createTestLable{
    lable = [[UILabel alloc]init];
    lable.frame = CGRectMake(100, 100, 200, 40);
    lable.text = @"...";
    [self.view addSubview:lable];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    step = [[UIStepper alloc] init];
    step.frame = CGRectMake(100, 150, 100, 100);
    
    //设置当前值及最大最小值
    step.minimumValue = 0;
    step.maximumValue = 10;
    step.value = 4;
    
    //设置步长
    step.stepValue = 2;
    
    //设置联续响应，按住时还会继续加减，而且越来越快
    step.autorepeat = YES;
    
    //是否将步进器所有结果都响应事件，为NO时只响应抬起时的事件
    //只有autorepeat为YES时有效
    step.continuous = YES;
    UISegmentedControl
    //触发事件
    [step addTarget:self action:@selector(stepEvent) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:step];
    [self createTestLable];
}
-(void)stepEvent{
    lable.text = [NSString stringWithFormat:@"%f",step.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
