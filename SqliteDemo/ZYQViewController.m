//
//  ZYQViewController.m
//  SqliteDemo
//
//  Created by 张毓庆 on 13-12-7.
//  Copyright (c) 2013年 张毓庆. All rights reserved.
//

#import "ZYQViewController.h"
#import "ZYQPersonManager.h"

@interface ZYQViewController ()
{
    NSArray *_personList;
}
@end

@implementation ZYQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSArray *array = @[@"张三", @"李四", @"王五", @"张老头"];
    
//    for (NSInteger i = 0; i < 50; i++) {
//        NSString *str = array[arc4random_uniform(4)];
//        NSString *name = [NSString stringWithFormat:@"%@%d", str, arc4random_uniform(1000)];
//        NSString *phoneNo = [NSString stringWithFormat:@"1390%05d", arc4random_uniform(100000)];
//
//        ZYQPerson *person = [ZYQPerson personWithID:i + 1 name:name age:18+arc4random_uniform(20) phoneNumber:phoneNo];
//       
//        [[ZYQPersonManager sharedZYQPersonManager] addPerson:person];
//    }
    
    _personList = [[ZYQPersonManager sharedZYQPersonManager] allPersons];
    
    NSArray *array = [[ZYQPersonManager sharedZYQPersonManager] personWithName:@"李四862"];
    
    NSLog(@"%@",array);
    
}

@end
