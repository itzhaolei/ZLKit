//
//  ZLScrollView.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLScrollView.h"
#import "ZLTemplateManger.h"

@implementation ZLScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.alwaysBounceVertical = YES;
        self.contentSize = self.bounds.size;
        self.backgroundColor = templateManger.backgroundColor;
        //ios11 适配
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.scrollIndicatorInsets = self.contentInset;
        }
    }
    return self;
}

@end
