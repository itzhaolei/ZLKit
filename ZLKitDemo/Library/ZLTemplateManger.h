//
//  ZLTemplateManger.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#define templateManger [ZLTemplateManger shared]

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTemplateManger : NSObject

///模板号
@property (nonatomic,unsafe_unretained) NSInteger tag;
///主色调
@property (nonatomic,strong) UIColor *mainColor;

///随机色
@property (nonatomic,strong,readonly) UIColor *randomColor;
///分割线的颜色
@property (nonatomic,strong,readonly) UIColor *lineColor;
///背景的颜色
@property (nonatomic,strong,readonly) UIColor *backgroundColor;
///轮廓的颜色
@property (nonatomic,strong,readonly) UIColor *borderColor;
///占位背景颜色
@property (nonatomic,strong,readonly) UIColor *placeholderColor;
///文字的颜色
@property (nonatomic,strong,readonly) UIColor *textBlackColor;
///文字的颜色
@property (nonatomic,strong,readonly) UIColor *textLightGrayColor;
///文字的字号
@property (nonatomic,unsafe_unretained,readonly) CGFloat font;
///大圆角
@property (nonatomic,unsafe_unretained,readonly) CGFloat maxRadian;
///小圆角
@property (nonatomic,unsafe_unretained,readonly) CGFloat minRadian;

///实例化
+ (instancetype)shared;

@end

@interface ZLTemplateManger ()

/* ----------------------------- 拓展使用 --------------------------------*/

///文字颜色
@property (nonatomic,strong,nullable) UIColor *textOtherColorA;
///文字颜色
@property (nonatomic,strong,nullable) UIColor *textOtherColorB;
///文字颜色
@property (nonatomic,strong,nullable) UIColor *textOtherColorC;
///文字颜色
@property (nonatomic,strong,nullable) UIColor *textOtherColorD;
///文字颜色
@property (nonatomic,strong,nullable) UIColor *textOtherColorE;
///文字颜色
@property (nonatomic,strong,nullable) UIColor *textOtherColorF;
///文字颜色
@property (nonatomic,strong,nullable) UIColor *textOtherColorG;

///背景颜色
@property (nonatomic,strong,nullable) UIColor *backgroundOtherColorA;
///背景颜色
@property (nonatomic,strong,nullable) UIColor *backgroundOtherColorB;
///背景颜色
@property (nonatomic,strong,nullable) UIColor *backgroundOtherColorC;
///背景颜色
@property (nonatomic,strong,nullable) UIColor *backgroundOtherColorD;
///背景颜色
@property (nonatomic,strong,nullable) UIColor *backgroundOtherColorE;
///背景颜色
@property (nonatomic,strong,nullable) UIColor *backgroundOtherColorF;
///背景颜色
@property (nonatomic,strong,nullable) UIColor *backgroundOtherColorG;

@end

NS_ASSUME_NONNULL_END
