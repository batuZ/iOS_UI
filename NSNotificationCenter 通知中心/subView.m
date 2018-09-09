//
//  subView.m
//  NSNotificationCenter 通知中心
//
//  Created by 张智 on 2018/9/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "subView.h"

@interface subView ()

@end

@implementation subView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"subView";
    //设置接收某个指定的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doSomeThing:) name:@"TT" object:nil];
}

//响应通知的事件
-(void)doSomeThing:(NSNotification*) noti{
    NSDictionary* dic = noti.userInfo;
    NSLog(@"%@", dic);
    if(self.view.backgroundColor == [UIColor blueColor]){
        self.view.backgroundColor = [UIColor redColor];
    }else if(self.view.backgroundColor == [UIColor redColor]){
        self.view.backgroundColor = [UIColor orangeColor];
    }else if(self.view.backgroundColor == [UIColor orangeColor]){
        self.view.backgroundColor = [UIColor yellowColor];
    }else if(self.view.backgroundColor == [UIColor yellowColor]){
        self.view.backgroundColor = [UIColor greenColor];
    }else{
        self.view.backgroundColor = [UIColor blueColor];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
