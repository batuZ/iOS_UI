//
//  MyTable.m
//  _UITableView 列表视图
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "MyTable.h"

@interface MyTable ()

@end

@implementation MyTable
//创建测试数据
-(void)createTestData{
    data = [[NSMutableArray alloc]init];
    for (int i = 'A'; i<= 'M'; i++) {
        NSMutableArray* subArr = [[NSMutableArray alloc]init];
        for (int j = 'a'; j<= 'g'; j++) {
            [subArr addObject:[NSString stringWithFormat:@"%c %c",i,j]];
        }
        [data addObject:subArr];
    }
}
//创建测试按钮
-(void)createTestBtn{
    UIBarButtonItem* edit = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editPress)];
    self.navigationItem.rightBarButtonItem = edit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [super didReceiveMemoryWarning];
    [self createTestData];
    [self createTestBtn];
    tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped]; //不分组风格UITableViewStylePlain
    
    tv.delegate = self;
    tv.dataSource = self;
    [self.view addSubview:tv];
    
    //自动布局,自动调整宽高
    tv.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    //增加组头或组尾视图（UIView）,广告或介绍
    
    tv.tableHeaderView = nil;
    tv.tableFooterView = nil;
    
    //当数据发生变化时，更新数据及视图
    [tv reloadData];
}

#pragma mark- 使用代理初始化列表

//UITableView 中的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [data count];
}

// 每组成员的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [data[section] count];
}

//设置单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellID = @"cell";
    //cell重用机制，尝试找到相同reuseIdentifier的单元格，
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    //主标题
    cell.textLabel.text = data[indexPath.section][indexPath.row];
    //子标题
    cell.detailTextLabel.text = @"子标题";
    //增加图像
    UIImage* img = [UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/images/timg5.jpg"];
    cell.imageView.image = img;
    
    return cell;
}

#pragma mark- 用代理设置UITableView
//设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
//设置组头标题
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"头部标题，组：%ld",section];
}
//设置组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}
//设置组尾标题
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return  [NSString stringWithFormat:@"组尾标题，成员数量：%ld",[data[section] count]];
}
//设置组尾高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    return 100;
}

#pragma mark- 协议事件，Cell
//通过edit按钮开启关闭编辑
-(void)editPress{
    static BOOL _isEdit;
    [tv setEditing:_isEdit];
    _isEdit = !_isEdit;
}
//设置单元格的编辑样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
        // 插入样式
        UITableViewCellEditingStyleInsert;
        // 删除样式
        UITableViewCellEditingStyleDelete;
        // 多选样式
        UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete;
    */
    return UITableViewCellEditingStyleDelete;
}
//提交编辑结果，同时也开启了拖动单元格进入编辑状态的功能
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"提交编辑：%ld,%ld",indexPath.section,indexPath.row);
    //删除数据，更新列表
    [data[indexPath.section] removeObjectAtIndex:indexPath.row];
    [tv reloadData];
}
//选中单元格时调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中单元格：%ld,%ld",indexPath.section,indexPath.row);
}
//取消选中单元格时调用
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"取消选中单元格：%ld,%ld",indexPath.section,indexPath.row);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
