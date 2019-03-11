//
//  ZLNavigationBackgroundBar.h
//  Pods-ZLNavigationBar_Example
//
//  Created by zhaolei on 2018/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLNavigationBackgroundBar : UIView

///高斯模糊层
@property (nonatomic,weak,readonly) UIVisualEffectView *effectView;
///图片层
@property (nonatomic,weak,readonly) UIImageView *backgroundImageView;
///底部分割线
@property (nonatomic,weak,readonly) UIView *bottomLine;

///还原初始化
- (void)reset;

@end

NS_ASSUME_NONNULL_END
