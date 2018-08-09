//
//  ViewController.m
//  JSON 数据解析
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //把json读进内存
    NSData* data = [NSData dataWithContentsOfFile:@"/Users/Batu/Downloads/testJSON.json"];
   
    //调解析类，把json解析为字典
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    //判断解析成功
    if([dic isKindOfClass:[NSDictionary class]]){
        NSLog(@"%@",dic);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
