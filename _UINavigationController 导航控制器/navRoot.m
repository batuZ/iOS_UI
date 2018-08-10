//
//  navRoot.m
//  _UINavigationController 导航控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "navRoot.h"
#import "navView_1.h"
@interface navRoot ()

@end

@implementation navRoot
-(void) setAnima{
    //创建动画对象
    CATransition* cat = [CATransition animation];
    //设置动画时长
    cat.duration = 1;
    //设置动画类型
    cat.type = @"cube";// moveli,revela,fade(default),pageCurl,pageUnCurl,suckEffect,rippleEffect,oglFlip
    //设置动动方向
    cat.subtype = kCATransitionFromLeft;
    //设置运动状态
    cat.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.navigationController.view.layer addAnimation:cat forKey:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"navRoot";
    UIImageView* iview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/images/timg1.jpg"]];
    iview.frame = self.view.bounds;
    [self.view addSubview:iview];
    //导航栏右侧按钮
    UIBarButtonItem* barBtn = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(barBtnPress)];
    
    //安装
    self.navigationItem.rightBarButtonItem = barBtn;
    
    //左侧按钮 默认为返回，如果指定了按钮，则没有这个默认按钮了
    //self.navigationItem.leftBarButtonItem = barBtn;
    
    [self setAnima];
}

-(void)barBtnPress{
    //创建下个视图的实例对象
    navView_1* nav_1 = [[navView_1 alloc]init];
    
    //用导航控制器进行推出操作
    [self.navigationController pushViewController:nav_1 animated:YES];
    
    //返回上一级动作，就是把自己退出
    //[self.navigationController popViewControllerAnimated:YES];
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
