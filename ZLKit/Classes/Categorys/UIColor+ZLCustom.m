//
//  UIColor+ZLCustom.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/10.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "UIColor+ZLCustom.h"

@implementation UIColor (ZLCustom)

///色值转颜色（十六进制）
+ (UIColor *)colorWithHex:(NSString *)string {
    if([string hasPrefix:@"#"]) {
        string = [string substringFromIndex:1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:string];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    int r = (hexNum >>16) &0xFF;
    int g = (hexNum >>8) &0xFF;
    int b = (hexNum) &0xFF;
    return [UIColor colorWithRed:r /255.0 green:g /255.0 blue:b /255.0 alpha:1.0];
}

@end
