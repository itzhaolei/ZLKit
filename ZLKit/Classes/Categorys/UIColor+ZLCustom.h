//
//  UIColor+ZLCustom.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/10.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZLCustom)

///色值转颜色（十六进制）
+ (UIColor *)colorWithHex:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
