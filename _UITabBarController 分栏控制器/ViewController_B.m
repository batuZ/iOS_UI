//
//  ViewController_B.m
//  _UITabBarController 分栏控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController_B.h"

@interface ViewController_B ()

@end

@implementation ViewController_B

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BBB";
    self.view.backgroundColor = [UIColor blueColor];
    UITabBarItem* itm = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:101];
    self.tabBarItem = itm;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
