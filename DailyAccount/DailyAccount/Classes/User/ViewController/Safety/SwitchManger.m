//
//  SwitchManger.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "SwitchManger.h"
#import <sqlite3.h>

static SwitchManger *manager = nil;

@implementation SwitchManger

+ (instancetype)sharedSwitchManager
{
    if (manager == nil)
    {
        manager = [[SwitchManger alloc] init];
    }
    return manager;
}

#pragma mark 打开数据库
// 如果数据库存在 则会直接打开，否则的话会先创建数据库，然后再打开
static sqlite3 *db = nil;
- (void)openDataBase
{
    if (db != nil)
    {
        return;
    }
    // 定义数据库保存的路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingPathComponent:@"data.sqlite"];
    //    NSLog(@"%@", path);
    // 根据路径打开或者创建数据库
    int result = sqlite3_open([path UTF8String], &db);
    if (result == SQLITE_OK)
    {
        NSLog(@"打开数据库成功");
    }
    else
    {
        NSLog(@"打开失败");
    }
}

#pragma mark 关闭数据库
- (void)closeDataBase
{
    int result = sqlite3_close(db);
    if (result == SQLITE_OK)
    {
        NSLog(@"关闭成功");
        db = nil;
    }
    else
    {
        NSLog(@"关闭失败");
    }
}

#pragma mark 创建表格
- (void)createTable
{
    // 1、SQL语句
    NSString *sql = @"CREATE TABLE cc (user_name TEXT PRIMARY KEY, user_pwd TEXT, user_info BLOB)";
    // 2、执行sql语句
    int result = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
    if (result == SQLITE_OK)
    {
        NSLog(@"创建表格成功");
    }
    else
    {
        NSLog(@"创建表格失败");
    }
}

#pragma mark 插入数据
- (void)insertDataToTableWithName:(NSString *)name
                           number:(NSString *)number
{
    // SQL语句
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO cc (user_name, user_pwd, user_info) VALUES (?,?,?)"];
    // 数据库准备状态  插入数据
    // 第三个参数：SQL语句的长度（填写-1即可）
    // 第四个参数：采用此种方式去插入数据，数据不是马上插入到数据库，而是先把数据保存在一个结果集里面（临时），最后把结果集整体插入到数据库  此处填写结果集对象
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, nil);
    
    if (result == SQLITE_OK)
    {
        // 准备完成
        // 把要插入的数据绑定到结果集stmt里面
        // 第二个int类型参数代表的是：上面SQL语句当中第几个? （给哪个字段赋值，在这里从1开始计算）
        // 第三个参数：要插入的数据（值）
        // 第四个参数：数据的长度（以字节为单位，如果数据时字符串统一填写-1）
        sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);
        
        // 把结果集数据存入到数据库(执行)
        sqlite3_step(stmt);
    }
    // 结果集完成(如果不结束，结果集会一直等待数据的输入，造成数据库的无法关闭)
    sqlite3_finalize(stmt);
}

@end
