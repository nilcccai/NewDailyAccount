//
//  SwitchManger.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwitchManger : NSObject


+ (instancetype)sharedSwitchManager;



/**
 *  打开数据库
 */
- (void)openDataBase;

/**
 *  关闭数据库
 */
- (void)closeDataBase;

/**
 *  创建表格
 */
- (void)createTable;

/**
 *	@parm number
 *  插入数据
 */
- (void)insertDataToTableWithName:(NSString *)name
                           number:(NSString *)number;

/**
 *  查询数据
 */
- (void)selectAllDataFromTable;

/**
 *	@parm name
 *  删除数据
 */
#pragma mark 删除数据（根据姓名删除一行数据）
- (void)deleteDataFromTableWithName:(NSString *)name;


#pragma mark 更新数据（根据姓名更新密码）
- (void)updataNumber:(NSString *)Number
         withName:(NSString *)name;



@end
