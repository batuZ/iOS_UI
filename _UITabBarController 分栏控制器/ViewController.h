//
//  ViewController.h
//  _UITabBarController 分栏控制器
//
//  Created by 张智 on 2018/8/8.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITabBarDelegate,UITabBarControllerDelegate>
{
    UITabBarController* tbCtrl;
}

@end

