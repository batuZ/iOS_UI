//
//  ViewController.m
//  _UIButton
//
//  Created by 张智 on 2018/8/4.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//创建一个普通按钮
-(void) createButton{
    UIButton* bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = CGRectMake(100, 100, 160, 60);

    //按下时会变样式
    [bt setTitle:@"Run" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bt setTitle:@"PrassDown!" forState:UIControlStateHighlighted];
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //直接设置文字颜色，优先级低于上面
    //[bt setTintColor:[UIColor yellowColor]];
    
    //button的文字是个lable
    bt.titleLabel.font = [UIFont systemFontOfSize:20];
    
    //设置button的点击事件
    //addTarget:self 指定实现事件动作的实例，就是动作在哪个类里
    //action:@selector(btPrass) 指定作动函数
    //forControlEvents:UIControlEventTouchUpInside 指定响应button的什么操作
    [bt addTarget:self action:@selector(btPrass) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bt];
}
-(void)btPrass{
    self.view.backgroundColor = [UIColor orangeColor];
}
//创建一个图像按钮
-(void) createImageButton{
    UIButton* imgBt = [UIButton buttonWithType:UIButtonTypeCustom];
    
    imgBt.frame = CGRectMake(100, 400, 160, 160);
    UIImage* img1 = [UIImage imageNamed:@"buImg.png"];
    UIImage* img2 = [UIImage imageNamed:@"buImg.png"];
    
    [imgBt setImage:img1 forState:UIControlStateNormal];
    [imgBt setImage:img2 forState:UIControlStateHighlighted];
    
    [imgBt addTarget:self action:@selector(imgBtPrass) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:imgBt];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButton];
    [self createImageButton];
}
-(void)imgBtPrass{
    self.view.backgroundColor = [UIColor yellowColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
