//
//  ViewController.m
//  _UINavigationController 导航控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"
#import "navRoot.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTestBnt];
}
//测试按钮
-(void)createTestBnt{
    UIButton *testBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testBt.frame = CGRectMake(80, 200, 200, 50);
    [testBt setTitle:@"jump to Navigation rootView" forState:UIControlStateNormal];
    [testBt addTarget:self action:@selector(btPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBt];
}

-(void)btPress{
    
    //创建导航控制器的根视图
    navRoot* nav_root = [[navRoot alloc]init];
    
    //创建导航控制器
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:nav_root];
    
    //是否透明
    nav.navigationBar.translucent = YES;
    
    //导航栏风格
    nav.navigationBar.barStyle = UIBarStyleBlack;
    
    //导航栏颜色
    nav.navigationBar.barTintColor = [UIColor redColor];
    
    //导航栏文字按钮颜色
    nav.navigationBar.tintColor = [UIColor yellowColor];
    
    //隐藏导航栏
    nav.navigationBar.hidden = NO;
    nav.navigationBarHidden = NO;
    
    //显示工具栏
    nav.toolbarHidden = NO;
    nav.toolbar.barTintColor = [UIColor greenColor];
    
    
    //推出导航控制器的根视图
    [self presentViewController:nav animated:YES completion:nil];
}

@end
