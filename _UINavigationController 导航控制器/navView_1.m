//
//  navView_1.m
//  _UINavigationController 导航控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "navView_1.h"
#import "navView_2.h"
@interface navView_1 ()

@end

@implementation navView_1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nav_1";
    self.view.backgroundColor = [UIColor orangeColor];
    
    //导航栏按钮
    UIBarButtonItem* subBtn_1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(BtnPress)];
    self.navigationItem.rightBarButtonItem = subBtn_1;
    //工具栏按钮
    UIBarButtonItem* a1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem* a2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    UIBarButtonItem* a3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    UIBarButtonItem* a4 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    //占位按钮，用来调整按钮间的距离
    UIBarButtonItem* space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = 60;
    
    NSArray* itms = [[NSArray alloc] initWithObjects:a1,space,a2,space,a3,space,a4, nil];
    self.toolbarItems = itms;
}
-(void)BtnPress{
    [self.navigationController pushViewController:[[navView_2 alloc] init] animated:YES];
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
