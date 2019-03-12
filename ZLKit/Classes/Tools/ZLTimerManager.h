//
//  ZLTimerManager.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTimerManager : NSObject

///定时器
@property (nonatomic,strong,nullable) NSTimer *timer;
///正在倒计时
@property (nonatomic,unsafe_unretained) BOOL isOnCountingDown;
///最大值
@property (nonatomic,unsafe_unretained) NSInteger maxNumber;
///最小值
@property (nonatomic,unsafe_unretained) NSInteger minNumber;
///循环
@property (nonatomic,copy) void (^run)(NSInteger number);

///开启、重新开启一个定时器（内存地址会发生改变）
- (void)startCountingDown;

//关闭定时器（销毁）
- (void)stopCountingDown;

@end

NS_ASSUME_NONNULL_END
