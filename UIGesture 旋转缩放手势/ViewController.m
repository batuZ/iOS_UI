//
//  ViewController.m
//  UIGesture 旋转缩放手势
//
//  Created by 张智 on 2018/8/7.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//创建测试view
-(void)createTestImage{
    imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/images/timg1.jpg"]];
    imgView.frame = CGRectMake(100, 100, 200, 360);
    //交互事件响应开关，默认为NO
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTestImage];
    
    //创建一个捏合手势
    UIPinchGestureRecognizer* pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    [imgView addGestureRecognizer:pinch];
    
    //创建一个旋转手势
    UIRotationGestureRecognizer* rot = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotAction:)];
    [imgView addGestureRecognizer:rot];
    
    //设置两个手势的代理属性
    pinch.delegate = self;
    rot.delegate = self;
}
//设置是否可以同时进行旋转和缩放
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
//当view被捏合时，对view进行缩放操作
-(void)pinchAction:(UIPinchGestureRecognizer*)pin{
    //设置view的变换属性
    //CGAffineTransformScale 输入原变换属性和x,y缩放值,获得新的变换属性
    pin.view.transform = CGAffineTransformScale(pin.view.transform, pin.scale, pin.scale);
    //设置当前比例为初始比例
    pin.scale = 1;
}
//当view被旋转时，对veiw进行旋转操作
-(void)rotAction:(UIRotationGestureRecognizer*)rot{
    rot.view.transform = CGAffineTransformRotate(rot.view.transform, rot.rotation);
    rot.rotation = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
