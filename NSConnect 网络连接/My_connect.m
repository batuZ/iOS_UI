//
//  My_connect.m
//  NSConnect 网络连接
//
//  Created by 张智 on 2018/8/10.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "My_connect.h"

@interface My_connect ()

@end

@implementation My_connect

- (void)viewDidLoad {
    [super viewDidLoad];
    mdata = [[NSMutableData alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//创建连接
- (IBAction)createConnect:(UIButton *)sender {
    
    //安全机制，需要指定此链接是安全的
    //在 info.plist中增加
    // App Transport Security Settings : Dictionary
    //  Allow Arbitrary Loads : Boolean YES
    
    NSURL* url = [NSURL URLWithString:@"http://www.baidu.com"];
    //创建一个连接请求
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //初始化连接对象
    con = [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark 协议事件

//连接错误信息
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
}
//处理服务器响应码
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse* res = (NSHTTPURLResponse*)response;
    
    switch (res.statusCode) {
        case 200:
            NSLog(@"服务器正常，连接成功！");
            break;
        case 404:
            NSLog(@"服务器正常，没有找到目标页面！");
            break;
        case 500:
            NSLog(@"服务器关机！");
            break;
        default:
            break;
    }
}
//回传数据时调用
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //将每次回传到数据放到一起
    [mdata appendData:data];
}
//完成数据回传时调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"%@",mdata);
}

//完成下载时调用
- (void)connectionDidFinishDownloading:(NSURLConnection *)connection destinationURL:(NSURL *) destinationURL{
    
}
@end

















