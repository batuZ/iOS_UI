//
//  ViewController.m
//  _UITabBarController 分栏控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"
#import "ViewController_A.h"
#import "ViewController_B.h"
#import "ViewController_C.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)createTestBtn{
    UIButton* bt =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = CGRectMake(100, 200, 160, 50);
    [bt setTitle:@"跳到分栏控制器" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTestBtn];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    //创建并列平级的子视图，并塞进一个数组
    ViewController_A* aa = [[ViewController_A alloc]init];
    ViewController_B* bb = [[ViewController_B alloc]init];
    ViewController_C* cc = [[ViewController_C alloc]init];
    NSArray* controllers  = [NSArray arrayWithObjects:aa,bb,cc, nil];
    
    //创建一个分栏控制器，并指定数组为视图集合
    tbCtrl = [[UITabBarController alloc] init];
    tbCtrl.viewControllers = controllers;
    
    //设置初始显示指定的视图
    tbCtrl.selectedIndex = 1;
   
    tbCtrl.delegate = self;
}
-(void)pressBtn{
    //推出分栏控制器
    [self presentViewController:tbCtrl animated:YES completion:^(void){
        NSLog(@"kkkk");
    }];
    NSLog(@"done");
}


//代理函数
-(void)tabBarController:(UITabBarController *)tabBarController
didSelectViewController:(UIViewController *)viewController{
    NSLog(@"选中控制器");
}

-(void)tabBarController:(UITabBarController *)tabBarController
willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
     NSLog(@"即将开始自定义编辑");
}

-(void)tabBarController:(UITabBarController *)tabBarController
willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
      NSLog(@"即将完成自定义编辑");
    if(changed)
    {
        NSLog(@"有改动");
    }
}

-(void)tabBarController:(UITabBarController *)tabBarController
didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
     NSLog(@"已经完成自定义编辑");
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{}
-(void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray<UITabBarItem *> *)items{}
-(void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed{}
-(void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items{}
-(void)tabBar:(UITabBar *)tabBar willEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed{}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
