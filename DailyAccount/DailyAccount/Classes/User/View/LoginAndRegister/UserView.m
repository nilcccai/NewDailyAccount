//
//  UserView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "UserView.h"

@implementation UserView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.userTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DAScreenWidth, DAScreenHeight) style:UITableViewStyleGrouped];
    [self addSubview:self.userTableView];
}

@end
