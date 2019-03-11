//
//  ZLTemplateManger.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLTemplateManger.h"

@interface ZLTemplateManger ()

{
    UIColor *_lineColor;
    UIColor *_borderColor;
    UIColor *_backgroundColor;
    UIColor *_textBlackColor;
    UIColor *_textLightGrayColor;
    CGFloat _font;
    CGFloat _maxRadian;
    CGFloat _minRadian;
}

@end

@implementation ZLTemplateManger

///实例化
+ (instancetype)shared {
    static ZLTemplateManger *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

#pragma mark - Lazy
- (NSInteger )tag {
    if (!_tag) {
        _tag = 0;
    }
    return _tag;
}
- (UIColor *)mainColor {
    if (!_mainColor) {
        _mainColor = [UIColor whiteColor];
    }
    return _mainColor;
}
- (UIColor *)randomColor {
    return [UIColor colorWithRed:(arc4random()%255) / 255.0 green:(arc4random()%255) / 255.0 blue:(arc4random()%255) / 255.0 alpha:1.0];
}
- (UIColor *)lineColor {
    if (!_lineColor) {
        _lineColor = [UIColor colorWithWhite:220 / 255.0 alpha:1.0];
    }
    return _lineColor;
}
- (UIColor *)borderColor {
    if (!_borderColor) {
        _borderColor = [UIColor colorWithWhite:230 / 255.0 alpha:1.0];
    }
    return _borderColor;
}
- (UIColor *)placeholderColor {
    return [UIColor colorWithRed:(243 + (arc4random()%12)) / 255.0 green:(243 + (arc4random()%12)) / 255.0 blue:(243 + (arc4random()%12)) / 255.0 alpha:1.0];
}
- (UIColor *)backgroundColor {
    if (!_backgroundColor) {
        _backgroundColor = [UIColor colorWithRed:239.0 / 255.0 green:239.0 / 255.0 blue:244.0 / 255.0 alpha:1.0];
    }
    return _backgroundColor;
}
- (UIColor *)textBlackColor {
    if (!_textBlackColor) {
        _textBlackColor = [UIColor colorWithWhite:51 / 255.0 alpha:1.0];
    }
    return _textBlackColor;
}
- (UIColor *)textLightGrayColor {
    if (!_textLightGrayColor) {
        _textLightGrayColor = [UIColor colorWithWhite:200 / 255.0 alpha:1.0];
    }
    return _textLightGrayColor;
}
- (CGFloat)font {
    if (!_font) {
        _font = 16.0;
    }
    return _font;
}
- (CGFloat)maxRadian {
    if (!_maxRadian) {
        _maxRadian = 6.0;
    }
    return _maxRadian;
}
- (CGFloat)minRadian {
    if (!_minRadian) {
        _minRadian = 3.0;
    }
    return _minRadian;
}

@end
