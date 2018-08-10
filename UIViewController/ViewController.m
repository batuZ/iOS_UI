//
//  ViewController.m
//  UIViewController
//
//  Created by 张智 on 2018/8/5.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"
#import "ViewYellow.h"
@interface ViewController ()

@end

@implementation ViewController

//用户点击屏幕调用
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewYellow* yellow = [[ViewYellow alloc]init];
    
    //显示一个新的视图控制器到屏幕上
    //animated 是否使用动画，completion 传入一个块参数供函数调用
    [self presentViewController:yellow animated:YES completion:nil];
    
    //返回之前的控制器，就是让当前控制器消失
    //[self dismissViewControllerAnimated:YES completion:nil];
}

//第一次加载此视图，只调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

//视图即将加载时，参数是否使用动画效果
- (void)viewWillAppear:(BOOL)animated{[super viewWillAppear:YES];}

//视图加载后，每次都会调
- (void)viewDidAppear:(BOOL)animated{[super viewDidAppear:YES];}

//视图即将退出
- (void)viewWillDisappear:(BOOL)animated{[super viewWillDisappear:YES];}

//视图退出后
- (void)viewDidDisappear:(BOOL)animated{[super viewDidDisappear:YES];}

//内存过低时
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}


@end
