//
//  ViewController_A.m
//  _UITabBarController 分栏控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController_A.h"

@interface ViewController_A ()

@end

@implementation ViewController_A

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAA";
    self.view.backgroundColor = [UIColor redColor];
    
    self.tabBarItem.badgeValue = @"ha";
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
