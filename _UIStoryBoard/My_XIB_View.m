//
//  My_XIB_View.m
//  _UIStoryBoard 故事板
//
//  Created by 张智 on 2018/11/5.
//  Copyright © 2018年 gvitech. All rights reserved.
//

#import "My_XIB_View.h"

@implementation My_XIB_View
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        //通过名称从文件中加载模版
        [[NSBundle mainBundle] loadNibNamed:@"MyXIB" owner:self options:nil];
        [self addSubview:self.view];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
