//
//  CalendarView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"

@class PWSCalendarView;

@protocol PWSCalendarDelegate <NSObject>

@optional
- (void) PWSCalendar:(PWSCalendarView*)_calendar didSelecteDate:(NSDate*)_date;

@end


@interface PWSCalendarView : UIView

@property (nonatomic, strong) id<PWSCalendarDelegate> delegate;
@property (nonatomic, assign) enCalendarViewType      type;
@property (nonatomic, strong) NSDate*                 dateShow;

- (id) initWithFrame:(CGRect)frame CalendarType:(enCalendarViewType)pType;


@end
