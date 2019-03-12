//
//  ZLLabel.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLLabel.h"
#import "ZLTemplateManger.h"

@implementation ZLLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont boldSystemFontOfSize:16.0];
        self.textColor = templateManger.textBlackColor;
    }
    return self;
}

@end
