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

#### UIViewController 的一些事件

关于加载和退出的事件
``` Objective-C
//第一次加载此视图，只调用一次
- (void)viewDidLoad {[super viewDidLoad];}

//视图即将加载时，参数是否使用动画效果
- (void)viewWillAppear:(BOOL)animated{[super viewWillAppear:YES];}

//视图加载后，每次都会调
- (void)viewDidAppear:(BOOL)animated{[super viewDidAppear:YES];}

//视图即将退出
- (void)viewWillDisappear:(BOOL)animated{[super viewWillDisappear:YES];}

//视图退出后
- (void)viewDidDisappear:(BOOL)animated{[super viewDidDisappear:YES];}

//内存过低时
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

```
关于用户操作的事件
``` Objective-C
//用户点击屏幕时调用
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{}
```
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
普通按钮，图像按钮，设置事件

#### UISwitch 开关控件
#### UIProgressView 进度条
        被动对象，只能相应事件，不能主动触发事件
#### UISlider 滑动条 显示播放进度或设置播放进度
        主动对象，可以出发事件
        
#### UIStepper 步进器 选择数量
    按指定步长设置值，受最大最小值限制

####  UISegmentedControl 分栏控件 
#### UIAlertController 提示对话框
#### UIActivityIndicatorView 等待指示器 
#### UITextField 单行文本输入框
#### UIScrollView 滚动视图（图像）375*667 
#### UITouch 全局的屏幕点击事件类 
#### UIGesture 点击手势

#### UINavigationController 导航控制器
#### UITabarController 分栏控制器

#### UIPickerView 选择视图 （日期编号等）

#### NSUserDefaults 本地化数据的全局类
#### UITableView 列表视图









