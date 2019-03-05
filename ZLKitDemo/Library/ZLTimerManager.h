//
//  ZLTimerManager.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#define timerManager [ZLTimerManager shared]

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTimerManager : NSObject

///实例化
+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
