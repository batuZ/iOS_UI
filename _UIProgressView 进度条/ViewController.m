//
//  ViewController.m
//  _UIProgressView 进度条
//
//  Created by 张智 on 2018/8/6.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)createTestBtn{
    UIButton* add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add.frame = CGRectMake(100, 200, 100, 40);
    [add setTitle:@"add" forState:UIControlStateNormal];
    [add addTarget:self action:@selector(addBtPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:add];
    
    UIButton* remove = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    remove.frame = CGRectMake(100, 250, 100, 40);
    [remove setTitle:@"remove" forState:UIControlStateNormal];
    [remove addTarget:self action:@selector(removeBtPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:remove];
}
-(void)addBtPress{
    if(_progress.progress < 1)
        _progress.progress += 0.1;
}
-(void)removeBtPress{
    if(_progress > 0)
        _progress.progress -= 0.1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _progress = [[UIProgressView alloc]init];
    //高不可变
    _progress.frame = CGRectMake(50, 100, 240, 0);
    //设置风格颜色
    _progress.tintColor = [UIColor yellowColor];
    _progress.progressViewStyle = UIProgressViewStyleDefault;
    //设置进度值
    _progress.progress = 0.3;
    
    [self.view addSubview:_progress];
    [self createTestBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
