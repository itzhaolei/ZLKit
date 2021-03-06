//
//  ZLTimerManager.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLTimerManager.h"

@interface ZLTimerManager ()

///当前数值
@property (nonatomic,unsafe_unretained) NSInteger number;

@end

@implementation ZLTimerManager

#pragma mark - Set
- (void)setMaxNumber:(NSInteger)maxNumber {
    _maxNumber = maxNumber;
    self.number = maxNumber;
}

///开启、重新开启一个定时器（内存地址会发生改变）
- (void)startCountingDown {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    if (self.willStart) {
        self.willStart();
    }
    __weak typeof(self)weakSelf = self;
    self.isOnCountingDown = YES;
    if (self.number == self.minNumber) {
        self.number = self.maxNumber;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

//关闭定时器
- (void)stopCountingDown {
    if (self.willStop) {
        self.willStop();
    }
    [self.timer invalidate];
    self.timer = nil;
    self.isOnCountingDown = NO;
    NSLog(@"*****  定时器已释放  *****");
}

- (void)timerAction {
    if (self.number <= self.minNumber) {
        [self stopCountingDown];
        return;
    }
    if (self.run) {
        self.run(self.number);
    }
    self.number -= 1;
}

@end
