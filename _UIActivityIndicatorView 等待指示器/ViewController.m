//
//  ViewController.m
//  _UIActivityIndicatorView 等待指示器
//
//  Created by 张智 on 2018/8/6.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    // 1
    UIActivityIndicatorView* actv1 = [[UIActivityIndicatorView alloc]init];
    actv1.frame = CGRectMake(100, 100, 0, 0);
    actv1.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:actv1];
    [actv1 startAnimating];  //开始
    //[actv1 stopAnimating]; //停止
    
    // 2
    UIActivityIndicatorView* actv2 = [[UIActivityIndicatorView alloc]init];
    actv2.frame = CGRectMake(100, 200, 0, 0);
    actv2.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    [self.view addSubview:actv2];
    [actv2 startAnimating];
    
    // 3
    UIActivityIndicatorView* actv3 = [[UIActivityIndicatorView alloc]init];
    actv3.frame = CGRectMake(100, 300, 0, 0);
    actv3.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:actv3];
    [actv3 startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
