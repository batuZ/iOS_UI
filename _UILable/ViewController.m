//
//  ViewController.m
//  _UILable 标签
//
//  Created by 张智 on 2018/8/4.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel* lable = [[UILabel alloc] init];
    lable.text = @"test";
    lable.frame = CGRectMake(80, 100, 160, 40);
    lable.backgroundColor = [UIColor blueColor];
    lable.font = [UIFont systemFontOfSize:12];
    lable.textColor = [UIColor yellowColor];
    lable.textAlignment = NSTextAlignmentLeft;
    lable.numberOfLines = 2; //lable显示行数，自动 0
    lable.shadowOffset = CGSizeMake(5, 5);
    lable.shadowColor = [UIColor blackColor];

    [self.view addSubview:lable];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
