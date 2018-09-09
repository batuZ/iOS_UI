//
//  AppDelegate.m
//  NSNotificationCenter 通知中心
//
//  Created by 张智 on 2018/9/9.
//  Copyright © 2018年 gvitech. All rights reserved.
/*
 
 NSNotificationCenter 较之于 Delegate 可以实现更大的跨度的通信机制，可以为两个无引用关系的两个对象进行通信。NSNotificationCenter 的通信原理使用了观察者模式：
 
 1. NSNotificationCenter 注册观察者对某个事件(以字符串命名)感兴趣，及该事件触发时该执行的 Selector 或 Block
 2. NSNotificationCenter 在某个时机激发事件(以字符串命名)
 3. 观察者在收到感兴趣的事件时，执行相应的 Selector 或 Block
 4. 互相之前为弱引用，缺少条件则不会完成事件。
 
 本示例结构：
    1、启动APP时创建一个timer来模拟被观察者的变更事件，并由此事件发出通知
    2、在nav某个子视图中（无引用关系）启用观察，接到通知时，调用指定方法
 */

#import "AppDelegate.h"
#import "Root.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    Root* rootView = [Root alloc] initw
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:[[Root alloc]init]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    //设置一个被观察者
    [NSTimer scheduledTimerWithTimeInterval:2.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        //被观察者出发通知，通过@"TT" 匹配接收对象
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TT" object:nil];
        NSLog(@".... 发出通知 .....");
    }];
    
    // 或 ：
    //[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(changeEvent:) userInfo:@"red" repeats:YES];
    
    return YES;
}






- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
