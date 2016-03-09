//
//  DataManager.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)sharedDataManager;

/**
 *  打开数据库
 */
- (void)openDataBase;

/**
 *  关闭数据库
 */
- (void)closeDataBase;

/**
 *  创建指纹锁记录表格
 */
- (void)createSwitchTable;

/**
 *	@parm state
 *  插入数据
 */
- (void)insertDataToTableWithstate:(NSString *)state;

/**
 *	@parm state
 *  更新数据
 */
- (void)updataState:(NSString *)state;

/**
 *  查询表中数据
 */
- (NSString *)selectAllDataFromTable;

@end
