//
//  ZYQPerson.h
//  SqliteDemo
//
//  Created by 张毓庆 on 13-12-7.
//  Copyright (c) 2013年 张毓庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYQPerson : NSObject
@property (assign,nonatomic) NSInteger ID;   // ID
@property (strong,nonatomic) NSString *name; // 姓名
@property (assign,nonatomic) NSInteger age;  // 年龄
@property (strong,nonatomic) NSString *phoneNumber; // 电话

/**
 *  工厂方法来创建一个Person对象
 *
 *  @param ID          编号
 *  @param name        姓名
 *  @param age         年龄
 *  @param phoneNumber 电话
 *
 *  @return Person对象
 */
+ (id)personWithID:(NSInteger)ID name:(NSString *)name age:(NSInteger)age phoneNumber:(NSString *)phoneNumber;
@end
