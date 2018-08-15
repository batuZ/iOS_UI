//
//  ViewController.m
//  NSURLSession
//
//  Created by 张智 on 2018/8/15.
//  Copyright © 2018年 gvitech. All rights reserved.
//
//  https://blog.csdn.net/csdnhaoren13/article/details/50809506
//  https://www.jianshu.com/p/88bcccbf7c96

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma mark 示例： 最简单的get请求
- (IBAction)examplePress:(UIButton *)sender {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://192.168.3.19:3000/man/utcTime"];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *strs = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"data:%@", strs);
    }];
    [task resume];
}

#pragma mark 示例： post请求
- (IBAction)testPost:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://192.168.3.19:3000/girl/params_value"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[@"urlPam=AAA&FiledPam=BBB" dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *strs=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", strs);
    }];
    [task resume];
}

#pragma mark 示例： 下载请求
- (IBAction)testDownload:(UIButton *)sender {
    //创建文件地址URL
    NSURL *url = [NSURL URLWithString:@"http://mirrors.hust.edu.cn/apache/tomcat/tomcat-9/v9.0.1/bin/apache-tomcat-9.0.1.tar.gz"];
    //获取单例全局共享的session对象
    NSURLSession *session = [NSURLSession sharedSession];
    //创建一个下载任务
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //这个location就是下载到磁盘的位置，默认是在沙盒tmp文件夹中国
        NSLog(@"Location %@", location);
        //tmp文件夹在关闭app后会自动删除，有需要可以使用NSFileManager将该文件转移到沙盒其他目录下
        //NSFileManager *fileManager = [NSFileManager defaultManager];
        //[fileManager copyItemAtPath:location.path toPath:@"" error:nil];
    }];
    //启动任务
    [downloadTask resume];
}
-(void)testDownload_1{
    NSURLSessionDownloadTask *task = [[NSURLSession sharedSession]
                                      downloadTaskWithURL:[NSURL URLWithString:@""]
                                      completionHandler:^(NSURL *location,
                                                          NSURLResponse *response,
                                                          NSError *error) {
                                          
                                          //下载完成后文件位于location处，我们需要移到沙盒中
                                          NSString *dirPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
                                          NSString *path = [dirPath stringByAppendingPathComponent:@"1.jpg"];
                                          
                                          NSFileManager *manager = [NSFileManager defaultManager];
                                          if ([manager fileExistsAtPath:path isDirectory:NO]) {
                                              [manager removeItemAtPath:path error:nil];
                                          }
                                          
                                          [manager moveItemAtPath:[location path] toPath:path error:nil];
                                          
                                      }];
    
    //开始任务
    [task resume];
}
//下载完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"下载完成 ： %@",location);
}




//续传的方法
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    NSLog(@"续传");
}


#pragma mark 示例： 通过NSSessionUploadTask上传文件，关键点是设置请求头参数和请求体拼接

#define boundary @"zanglitao"
-(void)testUpload{
    NSData* mydata = [self getDataBody];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost/iostest.php"]];
    //必须使用POST
    request.HTTPMethod = @"POST";
    //设置请求体
    request.HTTPBody = mydata;
    //设置请求头
    [request setValue:[NSString stringWithFormat:@"%ld",mydata.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary] forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionUploadTask *task = [[NSURLSession sharedSession]
                                    uploadTaskWithRequest   :request
                                    fromData                :mydata
                                    completionHandler       :^(
                                                               NSData           *data,
                                                               NSURLResponse    *response,
                                                               NSError          *error)
                                    {
                                        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                    }];
    
    [task resume];
}
-(NSData*)getDataBody{
    NSMutableData *data = [NSMutableData data];
    NSData *content = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]];
    [data appendData:[boundary dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:content];
    [data appendData:[boundary dataUsingEncoding:NSUTF8StringEncoding]];
    return data;
}

#pragma mark 示例：进度
-(void)progress{
    NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:cfg delegate:self delegateQueue:nil];
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:@""]];
    [task resume];
}

-(void)        URLSession   :(NSURLSession *)session
             downloadTask   :(nonnull NSURLSessionDownloadTask *)downloadTask
             didWriteData   :(int64_t)bytesWritten
        totalBytesWritten   :(int64_t)totalBytesWritten
totalBytesExpectedToWrite   :(int64_t)totalBytesExpectedToWrite{
    float percent = (float)totalBytesWritten/totalBytesExpectedToWrite;
    NSLog(@"%f",percent);//下载进度
}


-(void)           URLSession    :(NSURLSession *)session
                        task    :(NSURLSessionTask *)task
             didSendBodyData    :(int64_t)bytesSent
              totalBytesSent    :(int64_t)totalBytesSent
    totalBytesExpectedToSend    :(int64_t)totalBytesExpectedToSend{
    float percent = (float)totalBytesSent/totalBytesExpectedToSend;
    NSLog(@"%f",percent);//上传进度
}











- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark 1,NSURLSessionConfiguration：用于配置NSURLSession工作模式以及网络设置
    
    NSURLSessionConfiguration* sc;
    //  普通模式（default）：可以使用缓存
    sc = [NSURLSessionConfiguration defaultSessionConfiguration];
    //  瞬时模式（ephemeral）：不使用缓存
    sc = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    //  后台模式（background）：当按下home键后仍然可以在后台进行上传下载操作，需要通过唯一的identity标示
    sc = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"sd"];
    //  允许使用蜂窝数据
    sc.allowsCellularAccess = YES;
    //  表示任务后台运行时自动选择最佳的网络选择（综合考虑网络，电量）
    sc.discretionary = YES;
    //  只允许接受json数据
    [sc setHTTPAdditionalHeaders:@{@"Accept": @"application/json"}];
    //  设置请求的超时时间为30秒
    sc.timeoutIntervalForRequest = 30.0;
    //  设置资源处理的最长时间
    sc.timeoutIntervalForResource = 60.0;
    //  设置app对单一主机的最大的连接数
    sc.HTTPMaximumConnectionsPerHost = 1;
    
#pragma mark 2,NSURLSession：获取NSURLSession有下面几种方式
    
    NSURLSession* session ;
    //  共享的会话，使用全局的Cookie，缓存数据
    session = [NSURLSession sharedSession];
    //  使用配置好的NSURLSessionConfiguration获得会话
    session = [NSURLSession sessionWithConfiguration:sc];
    //  使用带队列和委托的会话
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    session = [NSURLSession sessionWithConfiguration:sc delegate:self delegateQueue:queue];
    
#pragma mark 2,NSURLSessionTask：会话任务，通过NSURLSession创建
    NSURLSessionTask *task;
    NSURL *url = [NSURL URLWithString:@""];
    task = [session dataTaskWithRequest:[NSMutableURLRequest requestWithURL:url]];
    task = [session dataTaskWithURL:url];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
