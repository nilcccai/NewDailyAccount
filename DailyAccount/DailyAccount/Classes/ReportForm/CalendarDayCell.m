//
//  CalendarDayCell.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "CalendarDayCell.h"
#import "Helper.h"

const NSString* PWSCalendarDayCellId = @"PWSCalendarDayCellId";

@interface PWSCalendarDayCell()
{
    UILabel* m_date;
}
@end

@implementation PWSCalendarDayCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self SetInitialValue];
    }
    return self;
}

- (void) SetInitialValue
{
    m_date = [[UILabel alloc] init];
    [m_date setFrame:self.bounds];
    [m_date setText:@""];
    [m_date setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:m_date];
}

- (void) SetDate:(NSDate*)_date
{
    NSString* day = @"";
    if (_date)
    {
        NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSDayCalendarUnit|NSMonthCalendarUnit fromDate:_date];
        day = [NSString stringWithFormat:@"%@", @(dateComponents.day)];
    }
    
    if ([PWSHelper CheckSameDay:_date AnotherDate:[NSDate date]])
    {
        [m_date setTextColor:[UIColor redColor]];
    }
    else
    {
        [m_date setTextColor:[UIColor blackColor]];
    }
    
    [m_date setText:day];
}


@end
