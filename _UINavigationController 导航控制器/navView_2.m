//
//  navView_2.m
//  _UINavigationController 导航控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "navView_2.h"

@interface navView_2 ()

@end

@implementation navView_2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nav_2";
    UIImageView* iview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/images/timg3.jpg"]];
    iview.frame = self.view.bounds;
    [self.view addSubview:iview];
    
    //做一个返回根的按钮
    UIBarButtonItem* bt = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(btPress)];
    self.navigationItem.rightBarButtonItem = bt;
    
    
    //工具栏按钮
    UIBarButtonItem* a1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop  target:self action:nil];
    UIBarButtonItem* a2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil];
    UIBarButtonItem* a3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:nil];
    UIBarButtonItem* a4 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:nil];
    //可变宽度占位按钮
    UIBarButtonItem* autoSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray* itms = [[NSArray alloc] initWithObjects:a1,autoSpace,a2,autoSpace,a3,autoSpace,a4, nil];
    self.toolbarItems = itms;
}
-(void)btPress{
    //直接退出到根视图
    [self.navigationController popToRootViewControllerAnimated:YES];
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
