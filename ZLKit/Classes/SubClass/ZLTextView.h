//
//  ZLTextView.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTextView : UITextView

///占位
@property (nonatomic,strong) NSString *placeholder;

///占位
@property (nonatomic,weak) UILabel *placeholderLabel;
///确定按钮
@property (nonatomic,weak,readonly) UIButton *doneButton;

///确定
@property (nonatomic,copy) void (^done)(NSString *text);
///实时监测文字
@property (nonatomic,copy) void (^change)(NSString *text);

@end

NS_ASSUME_NONNULL_END
