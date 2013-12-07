//
//  ZYQPersonManager.m
//  SqliteDemo
//
//  Created by 张毓庆 on 13-12-7.
//  Copyright (c) 2013年 张毓庆. All rights reserved.
//

#import "ZYQPersonManager.h"
#import <sqlite3.h>

@interface ZYQPersonManager()
{
    sqlite3 *_myDB;   // 数据库的连接
}
@end

@implementation ZYQPersonManager
single_implementation(ZYQPersonManager)

#pragma mark -  数据库的连接
- (id)init
{
    self = [super init];
    if (self)
    {
        // 创建数据库的连接并且打开数据库的连接
        [self openDB];
        
        [self createTable];
    }
    return self;
}

#pragma mark 打开数据库的操作
- (void)openDB
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *dbPath = [path stringByAppendingPathComponent:@"SqliteDemo.db"];
    
    if (sqlite3_open(dbPath.UTF8String, &_myDB) == SQLITE_OK)
    {
        NSLog(@"创建/打开数据库成功");
    }
    else
    {
        NSLog(@"创建/打开数据库失败");
    }
}

#pragma mark 执行单步的sql指令
/**
 *  执行单步的sql文方法
 *
 *  @param sql sql语句
 *  @param msg sql语句的描述
 */
- (void)execSql:(NSString *)sql msg:(NSString *)msg
{
    char *errmsg;
    
    if (sqlite3_exec(_myDB, sql.UTF8String, NULL, NULL, &errmsg) == SQLITE_OK)
    {
        NSLog(@"%@成功",msg);
    }
    else
    {
        NSLog(@"%@失败",msg);
    }
}

#pragma mark 创建数据库的表格
- (void)createTable
{
    NSString *sql = @"create table if not exists t_person (id integer primary key autoincrement,name text not null,age integer,photoNo text)";
    
    [self execSql:sql msg:@"创建数据库表格"];
}


#pragma mark - 数据库的增删改查方法
#pragma mark 添加个人记录
- (void)addPerson:(ZYQPerson *)person
{
    NSString *sql = [NSString stringWithFormat:@"insert into t_person (name,age,photoNo) values ('%@',%d,'%@')",person.name,person.age,person.phoneNumber];
    
    [self execSql:sql msg:@"添加个人记录"];
}

- (void)updatePerson:(ZYQPerson *)person
{
    
}

- (void)removePerson:(ZYQPerson *)person
{
    
}

/**
 *  查询指定sql返回的结果集合
 *
 *  @param sql sql语句
 *
 *  @return 查询返回的结果数组
 */

- (NSArray *)queryPersonsWithSql:(NSString *)sql
{
    sqlite3_stmt *stmt = NULL;
    
    NSMutableArray *persons = nil;
    
    // 先要评估sql语法是否错误
    if (SQLITE_OK == sqlite3_prepare_v2(_myDB, sql.UTF8String, -1, &stmt, NULL))
    {
        persons = [NSMutableArray array];
        
        while (SQLITE_ROW == sqlite3_step(stmt))
        {
            int ID = sqlite3_column_int(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            int age = sqlite3_column_int(stmt, 2);
            const unsigned char *phoneNo = sqlite3_column_text(stmt, 3);
            
            NSString *nameUTF8  = [NSString stringWithUTF8String:(const char *)name];
            NSString *phoneNumber = [NSString stringWithUTF8String:(const char *)phoneNo];
            
            ZYQPerson *person = [ZYQPerson personWithID:ID name:nameUTF8 age:age phoneNumber:phoneNumber];
            
            [persons addObject:person];
        }
    }
    else
    {
        NSLog(@"sql语法错误");
    }
    
    sqlite3_finalize(stmt);
    
    
    return persons;
}


- (NSArray *)allPersons
{
    NSString *sql = @"select * from t_person";
    
    return [self queryPersonsWithSql:sql];
}

- (NSArray *)personWithName:(NSString *)name
{
    NSString *sql = [NSString stringWithFormat:@"select * from t_person where name like '%%%@%%'",name];
    
   return  [self queryPersonsWithSql:sql];
}


@end
