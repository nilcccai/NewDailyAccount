//
//  CalendarViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarView.h"
#import "ReportViewController.h"
#import "ReportView.h"

@interface PWSCalendarViewController ()<PWSCalendarDelegate>

@end

@implementation PWSCalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
        [self SetInit];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"选择时间";
    
    //添加左侧 返回 按钮
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    //添加右侧 确定 按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)getWeekday:(UIButton *)sender{




}

//确定 按钮响应事件
-(void)rightItemAction:(UIBarButtonItem *)sender{
    
    ReportViewController *reportVC = [[ReportViewController alloc] init];
    [self dismissViewControllerAnimated:YES completion:nil];

}

//返回 按钮响应事件
-(void)leftItemAction:(UIBarButtonItem *)sender{
    //模态返回
    ReportViewController *reportVC = [[ReportViewController alloc] init];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//获取本月开始和结束时间
//- (void)getMonthBeginAndEndWith:(NSDate *)newDate{
//    if (newDate == nil) {
//        newDate = [NSDate date];
//    }
//    double interval = 0;
//    NSDate *beginDate = nil;
//    NSDate *endDate = nil;
//    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    [calendar setFirstWeekday:2];//设定周一为周首日
//    BOOL ok = [calendar rangeOfUnit:NSMonthCalendarUnit startDate:&beginDate interval:&interval forDate:newDate];
//    
//    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
//    if (ok) {
//        endDate = [beginDate dateByAddingTimeInterval:interval-1];
//    }else {
//        return;
//    }
//    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
//    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
//    NSString *endString = [myDateFormatter stringFromDate:endDate];
//    
//    NSCalendar *date
//     = [NSString stringWithFormat:@"%@-%@",beginString,endString];
//    
//}

- (void) SetInit
{
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    PWSCalendarView* view = [[PWSCalendarView alloc] initWithFrame:CGRectMake(0, 50, kSCREEN_WIDTH, 500) CalendarType:en_calendar_type_month];
    [self.view addSubview:view];
    [view setDelegate:self];
}

- (void) PWSCalendar:(PWSCalendarView*)_calendar didSelecteDate:(NSDate*)_date
{
    
}

@end
