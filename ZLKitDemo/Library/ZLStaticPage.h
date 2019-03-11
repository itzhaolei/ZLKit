//
//  ZLStaticPage.h
//  BulgeSeekUserPort
//
//  Created by zhaolei on 2018/8/17.
//  Copyright © 2018年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZLHTTPSessionManager/ZLHTTPSessionManager.h>

@interface ZLStaticPage : UIView

///提示语
@property (nonatomic,strong) NSMutableAttributedString *title;
///按钮标题
@property (nonatomic,strong) NSString *buttonTitle;
///图标名称
@property (nonatomic,strong) NSString *iconName;
///图标顶部间距
@property (nonatomic,unsafe_unretained) CGFloat imageTopInset;
///标题顶部间距
@property (nonatomic,unsafe_unretained) CGFloat titleTopInset;
///事件按钮顶部间距
@property (nonatomic,unsafe_unretained) CGFloat actionTopInset;

///事件
@property (nonatomic,copy) void (^buttonAction)(void);
///事件
@property (nonatomic,copy) void (^pageAction)(void);


///图标
@property (nonatomic,weak) UIImageView *iconImageView;
///标题
@property (nonatomic,weak) UILabel *titleLabel;
///事件按钮
@property (nonatomic,weak) UIButton *button;

///静态页的默认配置
- (void)defaultConfigMessage:(ZLHttpErrorState)errorState;

@end
