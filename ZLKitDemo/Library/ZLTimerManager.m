//
//  ZLTimerManager.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLTimerManager.h"

@implementation ZLTimerManager

///实例化
+ (instancetype)shared {
    static ZLTimerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

@end
