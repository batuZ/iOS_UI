//
//  ViewController.m
//  _UITextField 文本输出框
//
//  Created by 张智 on 2018/8/6.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    textf = [[UITextField alloc]init];
    textf.frame = CGRectMake(100, 100, 200, 60);
    
    //设置文字内容
    textf.text = @"test...";
    //设置文字大小
    textf.font = [UIFont systemFontOfSize:34];
    //设置文字颜色
    textf.textColor = [UIColor redColor];
    
    //边框风格
    textf.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置输入键盘风格
    textf.keyboardType = UIKeyboardTypeTwitter;
    
    //提示信息
    textf.placeholder = @"请输入密码...";
    
    //密码模式
    textf.secureTextEntry = NO;
    
    //使用代理函数时，要把自己塞入UITextField对象
    textf.delegate = self;
    
    [self.view addSubview:textf];
    
    //关于弹出和收回键盘
    //如果不弹出可以按 command + K
    //收回键盘要定义一个点击屏幕事件 touchesBegan
    //[textf resignFirstResponder];
    //resignFirstResponder 是让textf取消fouced
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [textf resignFirstResponder];
}
//UITextField 一些协议方法
//添加协议 <UITextFieldDelegate>

//当开始编辑时调用
-(void)textFieldDidBeginEditing:(UITextField *)textField{}
//当结束编辑时调用
-(void)textFieldDidEndEditing:(UITextField *)textField{}
//是否可以开始编辑
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{return YES;}
//是否可以结束编辑
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{return YES;}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
