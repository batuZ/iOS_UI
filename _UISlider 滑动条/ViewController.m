//
//  ViewController.m
//  _UISlider 滑动条
//
//  Created by 张智 on 2018/8/6.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)createTestLable{
    lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(100, 150, 200, 40);
    lable.text = @"...";
    [self.view addSubview:lable];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    slider = [[UISlider alloc] init];
    //size 高度影响点击范转
    slider.frame = CGRectMake(100, 100, 200, 40);
    
    //设置最大值 和 最小值
    slider.minimumValue = -100;
    slider.maximumValue = 100;
    
    //设置滑块位置
    slider.value = 30;
    
    //设置滑块和左右两侧颜色
    slider.thumbTintColor = [UIColor redColor];
    slider.minimumTrackTintColor = [UIColor orangeColor];
    slider.maximumTrackTintColor = [UIColor yellowColor];
    
    //滑动事件
    [slider addTarget:self action:@selector(sliderEvent) forControlEvents:UIControlEventValueChanged];
    
    //加入视图
    [self.view addSubview:slider];
    [self createTestLable];
}

-(void)sliderEvent{
    lable.text = [NSString stringWithFormat:@"%f",slider.value];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
