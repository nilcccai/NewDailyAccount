//
//  CalendarViewCell.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
@protocol PWSCalendarDelegate;

@interface PWSCalendarViewCell : UICollectionViewCell

@property (nonatomic, strong) id<PWSCalendarDelegate> delegate;
@property (nonatomic, assign) enCalendarViewType type;
@property (nonatomic, strong) NSDate*  currentDate;


- (void) SetWithDate:(NSDate*)pDate ShowType:(enCalendarViewType)pCalendarType;

@end
