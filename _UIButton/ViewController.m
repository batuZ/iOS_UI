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
    self.view bringSubviewToFront:<#(nonnull UIView *)#>
    //按下时会变样式
    [bt setTitle:@"Run" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bt setTitle:@"PrassDown!" forState:UIControlStateHighlighted];
    [bt setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //直接设置文字颜色，优先级低于上面
    //[bt setTintColor:[UIColor yellowColor]];
    
    //button的文字是个lable
    bt.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:bt];
}

//创建一个图像按钮
-(void) createImageButton{
    UIButton* imgBt = [UIButton buttonWithType:UIButtonTypeCustom];
    
    imgBt.frame = CGRectMake(100, 400, 160, 160);
    UIImage* img1 = [UIImage imageNamed:@"img1"];
    UIImage* img2 = [UIImage imageNamed:@"img2"];
    
    [imgBt setImage:img1 forState:UIControlStateNormal];
    [imgBt setImage:img2 forState:UIControlStateHighlighted];
    
    [self.view addSubview:imgBt];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButton];
    [self createImageButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
