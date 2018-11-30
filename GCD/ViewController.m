//
//  ViewController.m
//  GCD
//
//  Created by 张智 on 2018/11/30.
//  Copyright © 2018 gvitech. All rights reserved.
/**
 详细的参考资料：https://www.jianshu.com/p/2d57c72016c6
 
 Grand Central Dispatch(GCD) 是 Apple 开发的一个多核编程的较新的解决方法。
 它主要用于优化应用程序以支持多核处理器以及其他对称多处理系统。它是一个在线程池模式的基础上执行的并发任务。
 在 Mac OS X 10.6 雪豹中首次推出，也可在 iOS 4 及以上版本使用。
 
 
 GCD 可用于多核的并行运算
 GCD 会自动利用更多的 CPU 内核（比如双核、四核）
 GCD 会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
 程序员只需要告诉 GCD 想要执行什么任务，不需要编写任何线程管理代码
 
 
 
 
 */

#import "ViewController.h"
#import <Foundation/Foundation.h>
@implementation ViewController

#pragma - mark 队列
-(void)queue{
    //获取主线程队串行队列，这个队列中不要进行大规模运算，会阻塞主线程，多用于UI更新
    //只能在子线程中使用这个队列，主线程中使用会报错
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    //自定义串行队列 p1 队列标识，p2 队列属性
    dispatch_queue_t serialQueue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    
    
    //获取全局并行队列 p1 优先级 ，用于一般的小型的并发计算（并发时必须便用异步方法）
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //自定义并行队列 p1 队列标识，p2 队列属性 ，用于大规模并发计算（并发时必须便用异步方法）
    dispatch_queue_t concurrentQueue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
}

#pragma - mark 方法
-(void)dispatch{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //同步方法，在当前线程队列中执行block,不会开启新线程，队列以串行方式执行
    dispatch_sync(mainQueue, ^{});
    
    //异步方法，串行队列会创建一个新线程执行队列，并行队列会创建多个线程执行
    dispatch_async(globalQueue, ^{});
    
    //并发栅栏，类似异步等待，在一组并发后面加上此方法，会等前面的并发全部完成，才会执行此方法
    dispatch_barrier_async(globalQueue, ^{});
    
    //延时方法      ?? NSEC_PER_SEC
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), globalQueue, ^{});
    
    //全局只执行一次方法
    dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{});
    
    //快速迭代方法，用于并行，串行与for效果相同
    //此方法会等全部任务完成后，跳到下面的代码 NSLog(@"DONE");
    dispatch_apply(10, globalQueue, ^(size_t i){
        NSLog(@"%zu", i);
    });
    NSLog(@"DONE");
    
    //    6.5 GCD 队列组：dispatch_group
    //    6.5.1 dispatch_group_notify
    //    6.5.2 dispatch_group_wait
    //    6.5.3 dispatch_group_enter、dispatch_group_leave
    //
    //    6.6 GCD 信号量：dispatch_semaphore
    //    6.6.1 Dispatch Semaphore 线程同步
    //    6.6.2 Dispatch Semaphore 线程安全和线程同步（为线程加锁）
    //    6.6.2.1 非线程安全（不使用 semaphore）
    //    6.6.2.2 线程安全（使用 semaphore 加锁）
}

#pragma - mark 组合方式和效果

/**     同步方法 + 并发队列
 在当前线程，顺序执行队列，不创建新线程，也不并发
 
 以下组合效果相同：
 同步方法 + 串行队列
 异步方法 + main串行队列
 子线程中的 同步方法 + main串行队列
 没毛用！
 */
-(void)sync_Concurrent{
    NSLog(@"当前线程名：%@",[NSThread currentThread].name);
    dispatch_queue_t cQueue = dispatch_queue_create("my_Cqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法1第一次",[NSThread currentThread].name);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法1第二次",[NSThread currentThread].name);
    });
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法2第一次",[NSThread currentThread].name);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法2第二次",[NSThread currentThread].name);
    });
}

/**     异步方法 + 并发队列
 在新创建的线程中【并发】执行队列，当前线程不执行
 
 可以用来后台大规模计算
 */
-(void)async_Concurrent{
    NSLog(@"当前线程名：%@",[NSThread currentThread].name);
    dispatch_queue_t cQueue = dispatch_queue_create("my_Cqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法1第一次",[NSThread currentThread].name);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法1第二次",[NSThread currentThread].name);
    });
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法2第一次",[NSThread currentThread].name);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法2第二次",[NSThread currentThread].name);
    });
}

/**     异步方法 + 串行队列
 在新创建的线程中【顺序】执行队列，当前线程不执行
 
 可以用来创建子线程执行回调，为啥不直接用[[Thread alloc]init]
 */
-(void)async_Serial{
    NSLog(@"当前线程名：%@",[NSThread currentThread].name);
    dispatch_queue_t cQueue = dispatch_queue_create("my_Cqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法1第一次",[NSThread currentThread].name);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法1第二次",[NSThread currentThread].name);
    });
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法2第一次",[NSThread currentThread].name);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"当前线程名：%@, 同步方法2第二次",[NSThread currentThread].name);
    });
}









- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
        [self async_Concurrent];
    }];
    thread.name = @"subThread";
    [thread start];
    
}


@end
