//
//  AccountManger.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/7.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AccountManger.h"

static AccountManger *manger = nil;

@implementation AccountManger

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[AccountManger alloc] init];
    });
    return manger;
}

-(instancetype)init{
    _number = NO;
    return self;
}

@end
