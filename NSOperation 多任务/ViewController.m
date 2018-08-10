//
//  ViewController.m
//  NSOperation 多任务
//
//  Created by 张智 on 2018/8/10.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)createOpreations{
    
    //创建一个队列,创建后队列开始监视任务
    //当有任务加入，只要还有可用线程则立即执行
    queue = [[NSOperationQueue alloc]init];
    
    //设置队列并发数量
    [queue setMaxConcurrentOperationCount:5];
    
    //创建任务 方法1
    NSInvocationOperation* task1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(subAction:) object:@"params"];
    [queue addOperation:task1];
    
    //创建任务 方法2
    NSInvocation* task_o = [[NSInvocation alloc]init];
    [task_o setTarget:self];
    [task_o performSelector:@selector(subAction:)];
    [task_o performSelector:@selector(subAction:) withObject:@"params"];
    NSInvocationOperation* task2 = [[NSInvocationOperation alloc]initWithInvocation:task_o];
    [queue addOperation:task2];
    
    //创建任务 方法3
    [queue addOperationWithBlock:^{NSLog(@"");}];
    
}

-(void)subAction:(NSString*)str{}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(30, 50, 100, 50);
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    queue = [[NSOperationQueue alloc]init];
}
-(void)btnPress{
     [queue addOperationWithBlock:^{NSLog(@"aaaaaa");}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
