//
//  ReportView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportView.h"
#import "PieChartView.h"
#import "UIViewExt.h"
@interface ReportView()
//左侧按钮
@property (nonatomic,strong) UIButton *leftButton;

//右侧按钮
@property (nonatomic,strong) UIButton *rightButton;

@end


@implementation ReportView

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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-20) style:UITableViewStyleGrouped];
    self.tableView.tableHeaderView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.tableView];
    
#pragma mark ----- 日历套件按钮
    //添加日期视图
    self.dateView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 25)];
    self.dateView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self addSubview:self.dateView];
    
    
    //左侧按钮
    self.leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftButton.frame = CGRectMake(self.width/2-95, 0, 20, 25);
    [self.leftButton setTitle:@"<" forState:UIControlStateNormal];
    [self.dateView addSubview:self.leftButton];
    self.leftButton.tag = 100;
    
    //日期按钮
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange days = [c rangeOfUnit:NSDayCalendarUnit inUnit:kCFCalendarUnitMonth forDate:[NSDate date]];
    self.dateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.dateButton.frame = CGRectMake(self.width/2-75, 0, 160, 25);
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"yyyy年MM月"];
    NSString *date = [matter stringFromDate:[NSDate date]];
    [self.dateButton setTitle:[NSString stringWithFormat:@"%@1日～%lu日",date,(unsigned long)days.length] forState:UIControlStateNormal];
    [self.dateView addSubview:self.dateButton];
    self.dateButton.tag = 101;
    
    
    //右侧按钮
    self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.rightButton.frame = CGRectMake(self.width/2+75, 0, 20, 25);
    [self.rightButton setTitle:@">" forState:UIControlStateNormal];
    [self.dateView addSubview:self.rightButton];
    self.rightButton.tag = 102;
    
    //
    self.weakButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.weakButton.frame = CGRectMake(self.width/2-125, 0, 250, 25);
    [self.dateView addSubview:self.weakButton];
    [self.weakButton setTitle:@"2016年3月9日～2016年3月15日" forState:UIControlStateNormal];
    [self.weakButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.weakButton.hidden = YES;
}



@end
