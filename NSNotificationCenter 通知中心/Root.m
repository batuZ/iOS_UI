//
//  Root.m
//  NSNotificationCenter 通知中心
//
//  Created by 张智 on 2018/9/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "Root.h"
#import "subView.h"
@interface Root ()

@end

@implementation Root

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"root";
    self.view.backgroundColor = [UIColor whiteColor];
}
//推出子视图
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController  pushViewController:[[subView alloc]init] animated:YES];
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
