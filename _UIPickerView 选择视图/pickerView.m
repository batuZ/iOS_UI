//
//  pickerView.m
//  _UIPickerView 选择视图
//
//  Created by 张智 on 2018/8/9.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "pickerView.h"

@interface pickerView ()

@end

@implementation pickerView


- (IBAction)createTestBtn:(id)sender {
    UIPickerView* pker = [[UIPickerView alloc]init];
    pker.frame = CGRectMake(0, 50, 375, 300);
    //必须实现两个代理，用来初始化视图
    pker.delegate = self;
    pker.dataSource = self;
    
    
    [self.view addSubview:pker];
}
// 返回列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
// 返回【某列】的行数，某列为调用此函数的列
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        return 5;
    else if (component == 1)
        return 12;
    else
        return 30;
}
// 返回单元格的文字内容，谁调返回谁，有多少格调多少次
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0)
        return [NSString stringWithFormat:@"%ld年",row + 2017];
    
    if(component == 1)
        return [NSString stringWithFormat:@"%ld月",row + 1];
    
    if(component == 2)
        return [NSString stringWithFormat:@"%ld日",row + 1];
    
    return nil;
}
//把UIView对象显示在单元格里
-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    return [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"/Users/Batu/MyData/OC/iOS_UI/images/buImg.png"]];
}
//设置单元格的宽高
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 80;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return  50;
}

//选择某行后调用
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%ld 列，%ld 行",(long)component,(long)row);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
