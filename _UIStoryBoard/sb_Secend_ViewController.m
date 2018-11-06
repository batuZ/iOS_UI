//
//  sb_Secend_ViewController.m
//  _UIStoryBoard 故事板
//
//  Created by 张智 on 2018/11/5.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "sb_Secend_ViewController.h"

@interface sb_Secend_ViewController ()

@end

@implementation sb_Secend_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"from : %@ , to : SecendVC",segue.sourceViewController.title);
}


@end
