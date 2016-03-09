//
//  SZCalendarCell.m
//  SZCalendarPicker
//
//  Created by Stephen Zhuang on 14/12/1.
//  Copyright (c) 2014年 Stephen Zhuang. All rights reserved.
//

#import "SZCalendarCell.h"

@implementation SZCalendarCell
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:17]];
        [self addSubview:_dateLabel];
        
    }
    return _dateLabel;
}

-(UILabel *)name
{
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:self.bounds];
        [_name setTextAlignment:NSTextAlignmentCenter];
        [_name setFont:[UIFont systemFontOfSize:17]];
        [self addSubview:_name];
        
    }
    return _name;
    
    
}
@end
