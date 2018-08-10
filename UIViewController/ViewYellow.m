//
//  ViewYellow.m
//  UIViewController
//
//  Created by 张智 on 2018/8/5.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewYellow.h"

@interface ViewYellow ()

@end

@implementation ViewYellow
//UIView动画
-(void)animations{
    //开始动画, begin / commit可以嵌套
    [UIView beginAnimations:@"animaName" context:nil];
    //设置动画时长,秒
    [UIView setAnimationDuration:1];
    //设置延迟开始时长，秒
    [UIView setAnimationDelay:0];
    //设置动画代理对象
    [UIView setAnimationDelegate:self];
    //动画结束Action
    [UIView setAnimationDidStopSelector:@selector(animaStoped:)];
    //设置动作状态,线性运动（加速，减速....）
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    //动画内容
    bt.frame = CGRectMake(50, 300, 120, 50);
    
    //提交动画
    [UIView commitAnimations];
}
-(void)animaStoped:(NSString*)str{
    NSLog(@"%@",str);//animaName
}





-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = CGRectMake(50, 50, 120, 50);
    [bt setTitle:@"testtest" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(animations) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
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
