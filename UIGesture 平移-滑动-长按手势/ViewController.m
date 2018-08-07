//
//  ViewController.m
//  UIGesture 平移-滑动-长按手势
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
    imgView.frame = CGRectMake(100, 100, 200, 360);
    //交互事件响应开关，默认为NO
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTestImage];
    
    //创建一个平移手势
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
  //  [imgView addGestureRecognizer:pan];
    
    //创建一个滑动手势
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    //设置需要监视的滑动方向
    swipe.direction = UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown;
    [imgView addGestureRecognizer:swipe];
    
    //创建长按手势
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    //设置长按时间
    longPress.minimumPressDuration = 2;//秒
    [imgView addGestureRecognizer:longPress];
    
}
-(void)panAction:(UIPanGestureRecognizer*)pan{
    //获取平移坐标
    CGPoint pt = [pan locationInView:pan.view];
    NSLog(@"坐标 x:%f,y:%f",pt.x ,pt.y);
    
    //获取平移速度，即每秒移动的像素数
    CGPoint pv = [pan velocityInView:pan.view];
    NSLog(@"速度 横向 %f 像素/秒，竖向 %f 像素/秒",pv.x,pv.y);
}
-(void)swipeAction:(UISwipeGestureRecognizer*)swipe{
    if(swipe.direction & UISwipeGestureRecognizerDirectionUp){
         NSLog(@"向上滑动");
    }
    else if(swipe.direction & UISwipeGestureRecognizerDirectionDown){
         NSLog(@"向下滑动");
    }
}
-(void)longPressAction:(UILongPressGestureRecognizer*)longPress{
    //此函数在到达2秒时和手指抬起时都会触发
    //这是两种应用方式，需要用状态进行判断后再定义事件
    if(longPress.state == UIGestureRecognizerStateBegan){
        NSLog(@"到达长按时间触发");
    }else if(longPress.state == UIGestureRecognizerStateEnded){
        NSLog(@"到达长按时间，并抬起手指时触发");
    }
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
