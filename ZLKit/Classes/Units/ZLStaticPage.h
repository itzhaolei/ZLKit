//
//  ZLStaticPage.h
//  BulgeSeekUserPort
//
//  Created by zhaolei on 2018/8/17.
//  Copyright © 2018年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

///请求失败状态
typedef NS_ENUM (NSInteger , ZLStaticPageMessageType){
    ///空数据
    ZLStaticPageMessageTypeNullData = 0,
    ///服务器挂掉、访问地址不存在
    ZLStaticPageMessageTypeServerFailure ,
    ///超时
    ZLStaticPageMessageTypeTimeout ,
    ///断网
    ZLStaticPageMessageTypeNoNetwork
};

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

///展示默认的信息
- (void)showDefaultStaticPageMessage:(ZLStaticPageMessageType)messageType;

@end
