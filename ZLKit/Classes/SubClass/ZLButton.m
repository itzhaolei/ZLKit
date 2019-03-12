//
//  ZLButton.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLButton.h"
#import "ZLTemplateManger.h"

@implementation ZLButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:templateManger.textBlackColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
    }
    return self;
}

@end
