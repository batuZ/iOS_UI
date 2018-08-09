//
//  NSUserDef.h
//  NSUserDefaults 本地化全局类
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSUserDef : UIViewController
{
    NSUserDefaults* userd;
}
@property (weak, nonatomic) IBOutlet UITextField *saveKeyTF;
@property (weak, nonatomic) IBOutlet UITextField *saveValueTF;
@property (weak, nonatomic) IBOutlet UITextField *loadKeyTF;
@property (weak, nonatomic) IBOutlet UILabel *loadValueLable;

@end
