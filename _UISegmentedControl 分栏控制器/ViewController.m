//
//  ViewController.m
//  _UISegmentedControl 分栏控制器
//
//  Created by 张智 on 2018/8/6.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)createTestLable{
    lable = [[UILabel alloc]init];
    lable.frame = CGRectMake(100, 100, 100, 40);
    lable.text =@"...";
    [self.view addSubview:lable];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    segment = [[UISegmentedControl alloc]init];
    segment.frame = CGRectMake(20, 150, 300, 40);
    
    //向segment中插入按钮
    [segment insertSegmentWithTitle:@"AA" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"BB" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"CC" atIndex:2 animated:YES];
    
    //设置默认按钮
    segment.selectedSegmentIndex = 2;
    
    [segment addTarget:self action:@selector(segmentEvent) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    [self createTestLable];
}

-(void)segmentEvent{
    lable.text = [NSString stringWithFormat: @"%ld : %@", segment.selectedSegmentIndex , [segment titleForSegmentAtIndex:segment.selectedSegmentIndex]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
