//
//  ReportDetailView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportDetailView.h"
#import "UIViewExt.h"

@interface ReportDetailView()
//左侧按钮
@property (nonatomic,strong) UIButton *leftButtonD;
//右侧按钮
@property (nonatomic,strong) UIButton *rightButtonD;

@end

@implementation ReportDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self allViews];
    }
    return self;
}


- (void)allViews{
    
    //新建 tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 124, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-124) style:UITableViewStyleGrouped];
    [self addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
#pragma mark ----- 日历套件按钮
    //添加日期视图
    self.dateViewD = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 25)];
    self.dateViewD.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self addSubview:self.dateViewD];
    
    //左侧按钮
    self.leftButtonD = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftButtonD.frame = CGRectMake(self.width/2-70, 0, 20, 25);
    [self.leftButtonD setTitle:@"<" forState:UIControlStateNormal];
    [self.dateViewD addSubview:self.leftButtonD];
    self.leftButtonD.tag = 110;
    
    //日期按钮
    self.dateButtonD = [UIButton buttonWithType:UIButtonTypeSystem];
    self.dateButtonD.frame = CGRectMake(self.width/2-50, 0, 100, 25);
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"yyyy年MM月"];
    NSString *date = [matter stringFromDate:[NSDate date]];
    [self.dateButtonD setTitle:date forState:UIControlStateNormal];
    [self.dateViewD addSubview:self.dateButtonD];
    self.dateButtonD.tag = 111;
    
    //右侧按钮
    self.rightButtonD = [UIButton buttonWithType:UIButtonTypeSystem];
    self.rightButtonD.frame = CGRectMake(self.width/2+50, 0, 20, 25);
    [self.rightButtonD setTitle:@">" forState:UIControlStateNormal];
    [self.dateViewD addSubview:self.rightButtonD];
    self.rightButtonD.tag = 112;
    
    //分类汇总标签
    self.categoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, 40)];
    self.categoryView.backgroundColor = [UIColor colorWithRed:0.9 green:0.6 blue:0.7 alpha:1];
    [self addSubview:self.categoryView];
    
    //分类名      
    self.labelCategoryName = [[UILabel alloc] initWithFrame:CGRectMake(40,5,100,30)];
    self.labelCategoryName.text = @"支出";
    self.labelCategoryName.font = [UIFont systemFontOfSize:15];
    self.labelCategoryName.textColor = [UIColor darkGrayColor];
    [self.categoryView addSubview:self.labelCategoryName];
    
    //分类金额
    self.labelCategoryMoney = [[UILabel alloc] initWithFrame:CGRectMake(300,5,100,30)];
    self.labelCategoryMoney.text = @"456";
    
    // self.labelCategoryMoney.textAlignment = NSTextAlignmentRight;
    self.labelCategoryMoney.font = [UIFont systemFontOfSize:15];
    self.labelCategoryMoney.textColor = [UIColor darkGrayColor];
    [self.categoryView addSubview:self.labelCategoryMoney];
    
}

@end
