//
//  ZLNavigationBar.h
//  Pods-ZLNavigationBar_Example
//
//  Created by zhaolei on 2018/12/26.
//

#import <UIKit/UIKit.h>
#import "ZLNavigationBackgroundBar.h"
#import "ZLNavigationActionBar.h"
#import "ZLNavigationTransparencyManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLNavigationBar : UIView

///标题
@property (nonatomic,strong) NSString *title;
///背景图
@property (nonatomic,strong) UIImage *backgroundImage;
///背景层
@property (nonatomic,weak,readonly) ZLNavigationBackgroundBar *backgroundBar;
///事件层
@property (nonatomic,weak,readonly) ZLNavigationActionBar *actionBar;
///渐变功能
@property (nonatomic,strong,readonly) ZLNavigationTransparencyManager *transparencyManager;

///工厂方法
+ (instancetype)navigationBar;

///还原初始化
- (void)reset;

@end

NS_ASSUME_NONNULL_END
