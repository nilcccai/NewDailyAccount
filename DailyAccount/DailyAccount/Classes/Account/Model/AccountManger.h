//
//  AccountManger.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/7.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountManger : NSObject

@property(nonatomic,assign)BOOL number;

+ (instancetype)shareInstance;

@end
