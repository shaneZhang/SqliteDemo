//
//  ZYQPersonManager.h
//  SqliteDemo
//
//  Created by 张毓庆 on 13-12-7.
//  Copyright (c) 2013年 张毓庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYQPerson.h"
#import "Singleton.h"

@interface ZYQPersonManager : NSObject
single_interface(ZYQPersonManager)

// 新增个人记录
- (void)addPerson:(ZYQPerson *)person;

// 修改个人记录
- (void)updatePerson:(ZYQPerson *)person;

// 删除个人记录
- (void)removePerson:(ZYQPerson *)person;

// 查询所有的用户信息列表
- (NSArray *)allPersons;

/**
 *  根据用户的名字来查询个人信息
 *
 *  @param name 用户的名字
 *
 *  @return 查询结果集
 */
- (NSArray *)personWithName:(NSString *)name;
@end
