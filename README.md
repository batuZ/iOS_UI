# iOS_UI

## App结构及运行顺序
1、 main.m 函数通过类名启动程序框架，程序启动后首先调用代理AppDelegate中的方法application
2、AppDelegate中的属性window是个唯一的根视图（view）,也是UIView的子类
3、window必须有自己的控制器才能启动界面，程序会自动为其生成这个控制器（ViewController），这个控制器也叫根控制器
4、所以在AppDelegate中会做以下几件事：
``` Objective-C
//1、初始化window
//      先获取当前设备屏幕对象
UIScreen* scr = [UIScreen mainScreen];
//      获取屏幕尺寸
CGRect locaRect = scr.bounds;
//      初始化window
self.window = [[UIWindow alloc] initWithFrame:locaRect];

//2、为window指定根控制器，要先import进来
VC_window* VCRoot = [[VC_window alloc] init];
self.window.rootViewController = VCRoot;

//3、 设置当前window为根，并显示出来
[self.window makeKeyAndVisible];

```
5、程序中其它的控制器都是从根控制器开始创建并使用的，而所有的控件也都加载到window视图或其子视图上。
6、APP 结构
``` Objective-C
main{
    application{
        AppDelegate{
            ViewController(window){
                subViewController(subView){
                    UIButton{};
                    UILable{};
                    sub_subViewController(sub_subView){};
                }
            }
        }
    }
}
```

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


