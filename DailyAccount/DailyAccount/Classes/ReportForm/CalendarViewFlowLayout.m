//
//  CalendarViewFlowLayout.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "CalendarViewFlowLayout.h"

@implementation PWSCalendarViewFlowLayout

-(id)init
{
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
    }
    
    return self;
}

@end
