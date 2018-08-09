//
//  NSUserDef.m
//  NSUserDefaults 本地化全局类
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "NSUserDef.h"

@interface NSUserDef ()

@end

@implementation NSUserDef
- (IBAction)saveBut:(id)sender {
    [userd setObject:_saveValueTF.text forKey:_saveKeyTF.text];
    _saveValueTF.text = @"";
    _saveKeyTF.text=@"";
}
- (IBAction)loadBtn:(id)sender {
    _loadValueLable.text = [userd objectForKey:_loadKeyTF.text];
    //移除对象
    [userd removeObjectForKey:_loadKeyTF.text];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //重置 NSUserDefaults
    [NSUserDefaults resetStandardUserDefaults];
    userd = [NSUserDefaults standardUserDefaults];
    
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
