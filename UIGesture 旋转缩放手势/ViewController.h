//
//  ViewController.h
//  UIGesture 旋转缩放手势
//
//  Created by 张智 on 2018/8/7.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIGestureRecognizerDelegate> //实现同时旋转和缩放同时操作
{
    UIImageView* imgView;
}

@end

