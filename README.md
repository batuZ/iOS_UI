# iOS_UI

## 基础控件
#### UIView
        UIView是所有可视控件的父类，如UILable、UIButton等都继承于UIView
        所以，这些控件在加载时都调用IUView的addSubView:UIView方法
        UIView的属性和方法：
``` Objective-C
layer
tag
frame
bounds
center
transform
contentScaleFactor
multipleTouchEnabled
exclusiveTouch
superview
subviews
window
clipsToBounds
backgroundColor
alpha
opaque
clearsContextBeforeDrawing
hidden
...

- (void)removeFromSuperview;
- (void)addSubview:(UIView *)view;
//前后移动视图
- (void)sendSubviewToBack:(UIView *)view;
- (void)bringSubviewToFront:(UIView *)view;
...


```
        

#### UILable 标签
lable.text                       = @"test";                                     
lable.frame                    = CGRectMake(50, 50, 100, 40);
lable.backgroundColor = [UIColor clearColor];
lable.font                       = [UIFont systemFontOfSize:12];
lable.textColor              = [UIColor yellowColor];
lable.textAlignment       = NSTextAlignmentLeft;                     //对齐方式
lable.numberOfLines     = 2;                                                    //lable显示行数，自动 0
lable.shadowOffset       = CGSizeMake(5, 5);                         //影子的偏移量
lable.shadowColor        = [UIColor blackColor];

#### UIButton
普通按钮，图像按钮


