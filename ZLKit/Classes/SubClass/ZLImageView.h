//
//  ZLImageView.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLImageView : UIImageView

///设置比例拉伸
@property (nonatomic,unsafe_unretained) BOOL aspectFill;

///点击事件
@property (nonatomic,copy,nullable) void (^action)(void);

///遮盖层、封面层名称
@property (nonatomic,strong,nullable) NSString *coverImageName;
///遮盖层、封面层
@property (nonatomic,weak,readonly,nullable) UIImageView *coverImageView;

///标题
@property (nonatomic,weak,readonly,nullable) ZLLabel *titleLabel;
///子标题
@property (nonatomic,weak,readonly,nullable) ZLLabel *subTitleLabel;
///辅助内容
@property (nonatomic,weak,readonly,nullable) ZLLabel *otherTitleLabel;

///主图标
@property (nonatomic,weak,readonly,nullable) ZLImageView *iconImageView;
///辅助图标
@property (nonatomic,weak,readonly,nullable) ZLImageView *iconOhterImageView;

@end

NS_ASSUME_NONNULL_END
