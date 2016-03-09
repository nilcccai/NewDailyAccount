//
//  DataManager.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "DataManager.h"
#import <sqlite3.h>

static DataManager *manager = nil;

@implementation DataManager

+ (instancetype)sharedDataManager
{
    if (manager == nil)
    {
        manager = [[DataManager alloc] init];
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
- (void)createSwitchTable
{
    // 1、SQL语句
    NSString *sql = @"CREATE TABLE switch (state TEXT)";
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
- (void)insertDataToTableWithstate:(NSString *)state
{
    // SQL语句
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO switch (state) VALUES (?)"];
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
        sqlite3_bind_text(stmt, 1, [state UTF8String], -1, NULL);
        sqlite3_step(stmt);
    }
    // 结果集完成(如果不结束，结果集会一直等待数据的输入，造成数据库的无法关闭)
    sqlite3_finalize(stmt);
}

#pragma mark 更新数据
- (void)updataState:(NSString *)state
{
    NSString *sql = [NSString stringWithFormat:@"UPDATE switch SET state = '%@'", state];
    int result = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
    if (result == SQLITE_OK)
    {
        NSLog(@"更新成功");
    }
    else
    {
        NSLog(@"更新失败");
    }
}

#pragma mark 查询数据
- (NSString *)selectAllDataFromTable
{
    NSString *name;
    // 1、书写SQL语句
    NSString *sql = @"SELECT *FROM switch";
    // 2、定义结果集对象
    sqlite3_stmt *stmt = nil;
    // 数据库的准备状态
    int result = sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (result == SQLITE_OK)
    {
        // 拿出数据 判断结果集有没有数据  一行一行拿出
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            // 取数据从0开始
            // 取出name
            const char *nameChar = (const char *)sqlite3_column_text(stmt, 0);
            name = [NSString stringWithCString:nameChar encoding:NSUTF8StringEncoding];
            NSLog(@"%@", name);
            
        }
        // 结束结果集   放到while外即可
        sqlite3_finalize(stmt);
    }
    return name;
}

@end
