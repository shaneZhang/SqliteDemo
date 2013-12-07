//
//  ZYQPerson.m
//  SqliteDemo
//
//  Created by 张毓庆 on 13-12-7.
//  Copyright (c) 2013年 张毓庆. All rights reserved.
//

#import "ZYQPerson.h"

@implementation ZYQPerson

#pragma mark - 工厂方法来创建一个Person类的对象
+ (id)personWithID:(NSInteger)ID name:(NSString *)name age:(NSInteger)age phoneNumber:(NSString *)phoneNumber
{
    ZYQPerson *person = [[ZYQPerson alloc]init];
    person.ID = ID;
    person.name = name;
    person.age = age;
    person.phoneNumber = phoneNumber;
    
    return person;
}

#pragma mark - 重写打印的方法
- (NSString *)description
{
    return [NSString stringWithFormat:@"<Person:%p,ID:%d,name:%@,age:%d,phoneNumber:%@>",self,self.ID,self.name,self.age,self.phoneNumber];
}

@end
