//
//  My_connect.h
//  NSConnect 网络连接
//
//  Created by 张智 on 2018/8/10.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface My_connect : UIViewController
<
NSURLConnectionDelegate,
NSURLConnectionDownloadDelegate,
NSURLConnectionDataDelegate
>
{
    //连接对象
    NSURLConnection* con;
    //数据
    NSMutableData* mdata;
    
    NSURLSession* sess;
}
@end
