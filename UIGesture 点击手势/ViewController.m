//
//  ViewController.m
//  UIGesture 点击手势
//
//  Created by 张智 on 2018/8/7.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//创建测试view
-(void)createTestImage{
    imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/IMG_1.PNG"]];
    imgView.frame = CGRectMake(30, 50, 200, 360);
    //交互事件响应开关，默认为NO
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTestImage];
    
    //创建一个【单点单击】手势对象，用来识别点击手势事件
    UITapGestureRecognizer* tapOneOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressOneOne:)];
    //设置手势属性，点击次数
    tapOneOne.numberOfTapsRequired = 1;
    //点击触点数
    tapOneOne.numberOfTouchesRequired = 1;
    //把手势加载到目标视图上，只在这个视图上有效，视图外不响应
    [imgView addGestureRecognizer:tapOneOne];
    
    //创建一个单点双击手势
    UITapGestureRecognizer* tapOneTwo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressOneTwo:)];
    tapOneTwo.numberOfTouchesRequired = 1;
    tapOneTwo.numberOfTapsRequired = 2;
    [imgView addGestureRecognizer:tapOneTwo];
    
    //处理单击与双击的冲突，当单击与双击同时发生时，单击不执行
    [tapOneOne requireGestureRecognizerToFail:tapOneTwo];
}

//单点单击事件函数
-(void)pressOneOne:(UITapGestureRecognizer*)tap{
    //加入动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];//默认为1秒
    tap.view.frame = CGRectMake(30, 50, 200, 360);
    [UIView commitAnimations];
}
//单点双击事件函数
-(void)pressOneTwo:(UITapGestureRecognizer*)tap{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    tap.view.frame = self.view.bounds;
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
