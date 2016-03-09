//
//  ReportSpecificView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportSpecificView.h"

@implementation ReportSpecificView

//初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

//实现方法
-(void)setupView{
    self.backgroundColor = [UIColor cyanColor];
    
    self.table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    //设置分割线的颜色
    self.table.separatorColor = [UIColor redColor];
    //设置分割线的样式
    self.table.separatorStyle = UITableViewCellSelectionStyleDefault;
    
    [self addSubview:self.table];
    
    //新建底部button
    self.bottomButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.bottomButton.frame = CGRectMake(0, DAScreenHeight - 40, DAScreenWidth, 40);
    [self.bottomButton setTitle:@"编辑" forState:UIControlStateNormal];
    self.bottomButton.font = [UIFont systemFontOfSize:14];
//    //3.设置圆角幅度
//    self.bottomButton.layer.cornerRadius = 1.0;
//    self.bottomButton.layer.borderWidth = 1.3;
    [self addSubview:self.bottomButton];
    
}

@end
