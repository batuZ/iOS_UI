//
//  ViewController.m
//  NSThread 多线程
//
//  Created by 张智 on 2018/8/10.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)createThreads{
    //先创建再启动子线程
    NSThread* th_1 = [[NSThread alloc] initWithBlock:^{NSLog(@"aa");}];
    [th_1 start];
    NSThread* th_2 = [[NSThread alloc] initWithTarget:self selector:@selector(subAction:) object:@"params"];
    [th_2 start];
    
    //创建并启动子线程
    [NSThread detachNewThreadWithBlock:^{NSLog(@"aa");}];
    [NSThread detachNewThreadSelector:@selector(subAction:) toTarget:self withObject:@"params"];
    
    //线程锁
    NSLock* locker = [[NSLock alloc]init];
    [locker lock];
    testItem++;
    [locker unlock];
    
}
-(void)subAction:(NSString*)str{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
