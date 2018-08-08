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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"navRoot";
    self.view.backgroundColor = [UIColor blueColor];
   
    //导航栏右侧按钮
    UIBarButtonItem* barBtn = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(barBtnPress)];
    
    //安装
    self.navigationItem.rightBarButtonItem = barBtn;
    
    //左侧按钮 默认为返回，如果指定了按钮，则没有这个默认按钮了
    //self.navigationItem.leftBarButtonItem = barBtn;
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
