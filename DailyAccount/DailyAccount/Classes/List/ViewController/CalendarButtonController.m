//
//  CalendarButtonController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "CalendarButtonController.h"
#import "SZCalendarPicker.h"
@interface CalendarButtonController ()

@end

@implementation CalendarButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"日历";
//    日历按钮
    self.view.backgroundColor = [UIColor whiteColor];
    
    SZCalendarPicker *calendarPicker = [SZCalendarPicker showOnView:self.view];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    calendarPicker.frame = CGRectMake(0, 100, self.view.frame.size.width, 352);
    calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
        
        NSLog(@"%li-%li-%li", (long)year,(long)month,(long)day);
    };
    
}


@end
