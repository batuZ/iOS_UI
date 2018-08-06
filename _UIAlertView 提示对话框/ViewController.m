//
//  ViewController.m
//  _UIAlertView 提示对话框
//
//  Created by 张智 on 2018/8/6.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//测试按钮
-(void)createTestLable{
    lable = [[UILabel alloc]init];
    lable.frame = CGRectMake(100, 100, 100, 40);
    lable.text = @"...";
    [self.view addSubview:lable];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 150, 100, 40);
    [btn setTitle:@"Test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

// 提示框
-(void) showAlert{
   
    //初始化一个提示框
    alert = [UIAlertController alertControllerWithTitle:@"颜色" message:@"选择背景颜色。" preferredStyle:UIAlertControllerStyleAlert];
    
    //定义取消按钮
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        self->lable.text = @"取消";
        self.view.backgroundColor = [UIColor whiteColor];
    }];
    [alert addAction:cancel];
    //自定义按钮
    UIAlertAction* red = [UIAlertAction actionWithTitle:@"红的" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action){
        self->lable.text = @"红红的";
        self.view.backgroundColor = [UIColor redColor];
    }];
    [alert addAction:red];
    //自定义按钮
    UIAlertAction* yellow = [UIAlertAction actionWithTitle:@"黄的" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        self->lable.text = @"黄黄的";
        self.view.backgroundColor = [UIColor yellowColor];
    }];
    [alert addAction:yellow];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建测试控件
    [self createTestLable];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
