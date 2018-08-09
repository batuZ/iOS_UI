//
//  MyTable.h
//  _UITableView 列表视图
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTable : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* tv;
    NSMutableArray* data;
}
@end
