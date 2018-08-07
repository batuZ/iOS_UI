//
//  ViewController.m
//  UITouch 点击事件
//
//  Created by 张智 on 2018/8/7.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/IMG_1.PNG"]];
    imgView.frame = CGRectMake(30, 50, 200, 360);
    [self.view addSubview:imgView];
}

//点击屏幕瞬间调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取点击事件对象
    UITouch* tc = [touches anyObject];
    if(tc.tapCount == 1)
    {
        NSLog(@"单击");
    }
    else if(tc.tapCount == 2)
    {
        NSLog(@"双击");
    }
}
//在屏幕上滑动时连续调用
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* tc = [touches anyObject];
    //获取称动时在屏幕上的坐标
    CGPoint pt = [tc locationInView:self.view];
    NSLog(@"x = %f,y = %f",pt.x,pt.y);
    
    imgView.frame = CGRectMake(pt.x, pt.y, imgView.frame.size.width, imgView.frame.size.height);
}

//结束点击的瞬间调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{}

//意外中断touch时调用，用来处理意外发生时的安全保护动作
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
