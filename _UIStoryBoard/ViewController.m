//
//  ViewController.m
//  _UIStoryBoard 故事板
//
//  Created by 张智 on 2018/11/5.
//  Copyright © 2018年 gvitech. All rights reserved.
/*
 
 默认创建的两个StoryBoard：
    Main.storyboard 默认故事板主入口，对应的控制器就是一起被创建的ViewController类
    LaunchScreen.storyboard 启动界面
 
 
StoryBoart组织APP结构的常用方法
 1、创建StoryBoart：一个工程可以有多个StoryBoart，APP主入口在工程设置面版中指定
    General -> Deployment Info -> Main Interface -> 指定目标StoryBoart
 
 2、每个StoryBoart有默认的入口控制器，通过设置某个控制器的 Is Initial View Controller 选项确定
 
 3、StoryBoart只能创建控制器模版，模版需要绑定对应类型的类，才可以进一步操作。
 
 4、控制器之前的切换由Sugue对象管理，用来确定转场方式和传值。如：
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 
 5、退回之前某页面
    目标控制器要实现如下函数，供StoryBoart中的控制器调用，调用方法是把退回按钮拖到控制器的EXIT图标上，并指定目标，如：
    - (IBAction)backToRootVC:(UIStoryboardSegue *)segue
 
 6、从一个StoryBoart跳转到另一个StoryBoart，在团队协作时会用到
    不能通过连线方式创建action,需要手动写跳传代码，如：
    - (IBAction)toSecendStoryBoard:(UIButton *)sender
 
 7、StoryBoart引用xib,在某view需要在多处使用时，最好用纯代码创建UIView，也可以创建一个xib可视化界面供StoryBoart重复调用。这里以创建子视图为例，过程如下：
        a、创建一个继承于UIView的类(My_XIB_View)，和一个空的xib文件（My_XIB,最好同名,不同也行）。
        b、把My_XIB的File‘s Owner指定为My_XIB_View
        c、在My_XIB中拉入一下UIView,自由size为200*100，把这个View IBOutlet到My_XIB_View.h中，记录一个实例变量，初始化时会用。
        d、创建自定义视图，设置一些约束，如:My_XIB.xib
        e、重写My_XIB_View的构造方法
        -(instancetype)initWithCoder:(NSCoder *)aDecoder
        f、在StoryBoard中需要用到的地方拉入一个UIVew,并把class指定为My_XIB_View,加载页面后即可显示
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//启动目标页面，可以同时把参数传给下个页面
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //判断标识符
    if([segue.identifier isEqualToString:@"root2secend"])
    {
       // do taget thing...
    }
    
    //获得当前控制器egue.sourceViewController
    //和目标控制器segue.destinationViewController
    NSLog(@"from : %@ , to : %@",
          segue.sourceViewController.title,
          segue.destinationViewController.title);
}

//接收页面退回操作，参数中包含退回动作的执行VC，同样也可以通过VC实例进行传值
- (IBAction)backToRootVC:(UIStoryboardSegue *)segue {
    NSLog( @"from:%@ back to Root", segue.sourceViewController.title);
}

//从一个StoryBoart跳转到另一个StoryBoart
- (IBAction)toSecendStoryBoard:(UIButton *)sender {
    //通过名称获取另一个故事板对象
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"SecendSB" bundle:nil];
    
    //跳到另一个StoryBoard的指定控制器，通过Identifier指定
    UIViewController *tagVC = [secondStoryboard instantiateViewControllerWithIdentifier:@"sec_SB_VC4"];
    
    //获取另一个StoryBoard的入口控制器
    //UIViewController * tagVC = [secondStoryboard instantiateInitialViewController];
    
    if(!tagVC) return;
    
    //模态推出第二个故事板的视图控制器
    [self presentViewController:tagVC animated:YES completion:nil];
    
    //以导航子级状态推出第二个故事板的视图控制器
    //[self.navigationController pushViewController:tagVC animated:YES];
}

@end
