//
//  ViewController.m
//  _UIScrollView 滚动视图
//
//  Created by 张智 on 2018/8/7.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)createUIScrollView{
    
    sv = [[UIScrollView alloc] init];
    sv.frame = self.view.bounds;//375*667
    sv.backgroundColor = [UIColor yellowColor];
    //画布大小，两张图，所以横向*2
    sv.contentSize=CGSizeMake(375*2, 667);
    //整页滚动，图不会停在中间
    sv.pagingEnabled =YES;
    //滚动效果，不会跳转
    sv.scrollEnabled =YES;
    //边缘弹动效果
    sv.bounces=YES;
    //横向、纵向弹动
    sv.alwaysBounceVertical=NO;
    sv.alwaysBounceHorizontal=YES;
    //显示横向、纵向滚动条
    sv.showsHorizontalScrollIndicator=YES;
    sv.showsVerticalScrollIndicator=YES;
    
    //设置显示偏移，就是当前显示哪页，第二页
    sv.contentOffset = CGPointMake(375, 0);
    
    //是否响应点击事件,NO时就不能通过屏幕操作了
    sv.userInteractionEnabled = YES;
    
    //加入图像
    UIImage* img1 = [UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/images/timg1.jpg"];
    UIImage* img2 = [UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/images/timg2.jpg"];
    UIImageView* imgView1 = [[UIImageView alloc] initWithImage:img1];
    UIImageView* imgView2 = [[UIImageView alloc] initWithImage:img2];
    imgView1.frame = CGRectMake(0, 0, 375, 667);
    imgView2.frame = CGRectMake(375, 0, 375, 667);
    [sv addSubview:imgView1];
    [sv addSubview:imgView2];
    
    [self.view addSubview:sv];
}

// 协议函数

//滚动时连续调用
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{}
//将要结束滚动时调用
-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{}
//结束滚动时调用
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{}
//将要减速时调用
-(void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{}
//完成减速，图像静止的瞬间调用
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建滚动视图
    [self createUIScrollView];
    //设置代理对象
    sv.delegate = self;
    NSLog(@"OK!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
