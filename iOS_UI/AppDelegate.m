//
//  AppDelegate.m
//  iOS_UI
//
//  Created by 张智 on 2018/8/4.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "AppDelegate.h"
#import "VC_window.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1、初始化window
    //      先获取当前设备屏幕对象
    UIScreen* scr = [UIScreen mainScreen];
    //      获取屏幕尺寸
    CGRect locaRect = scr.bounds;
    //      初始化window
    self.window = [[UIWindow alloc] initWithFrame:locaRect];
    
    //2、为window指定根控制器，要先import进来
    VC_window* VCRoot = [[VC_window alloc] init];
    self.window.rootViewController = VCRoot;
    
    //3、 设置当前window为根，并显示出来
    [self.window makeKeyAndVisible];
    VCRoot.view.backgroundColor  = [UIColor redColor];
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
