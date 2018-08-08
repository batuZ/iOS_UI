//
//  ViewController.m
//  视图布局
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"
@interface ViewController ()

@end

@implementation ViewController

//自动布局
-(void)autoLayerout{
    //创建一个父视图，并设置变化动作
    UIView* father = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
    father.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    father.tag = 999;
    //创建一个子物体，实现自动响应父视图动作
    UIButton* sunBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sunBt.frame=CGRectMake(100, 160, 100, 40);
    sunBt.backgroundColor = [UIColor redColor];
    [sunBt setTitle:@"sunBt_auto" forState:UIControlStateNormal];
    [sunBt addTarget:self action:@selector(BtPress:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置自动布局属性
    sunBt.autoresizingMask = UIViewAutoresizingFlexibleTopMargin    //自动调整与顶部的距离
    |UIViewAutoresizingFlexibleLeftMargin;  //自动调整与左边缘的距离
    
    [father addSubview:sunBt];
    [self.view addSubview:father];
    
}

//手动布局 , 使用UIView的layoutSubviews函数
-(void)setLayout{
    myView* myveiw = [[myView alloc]init];
    myveiw.frame = CGRectMake(20, 340, 200, 200);
    [self.view addSubview:myveiw];
    [myveiw.myBt addTarget:self action:@selector(BtPress:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)BtPress:(UIButton*)bt{
    UIView* fa = bt.superview;
    [UIView beginAnimations:nil context:nil];
    if(fa.tag == 999)
    {
        if(fa.frame.size.width == 200)
            fa.frame = CGRectMake(20, 20, 300, 300);
        else
            fa.frame = CGRectMake(20, 20, 200, 200);
    }
    else
    {
        if(fa.frame.size.width == 200)
            fa.frame = CGRectMake(20, 340, 300, 300);
        else
            fa.frame = CGRectMake(20, 340, 200, 200);
    }
    [UIView commitAnimations];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self autoLayerout];
    [self setLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
