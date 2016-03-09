//
//  UserInfoView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "UserInfoView.h"

@implementation UserInfoView

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
    self.infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DAScreenWidth, DAScreenHeight) style:UITableViewStyleGrouped];
    [self addSubview:self.infoTableView];
}

@end
