//
//  ZLNavigationBackgroundBar.m
//  Pods-ZLNavigationBar_Example
//
//  Created by zhaolei on 2018/12/28.
//

#import "ZLNavigationBackgroundBar.h"
#import "ZLNavigationBarPrivateHeader.h"

@interface ZLNavigationBackgroundBar ()

{
    ///高斯模糊层
    UIVisualEffectView *_effectView;
    ///图片层
    UIImageView *_backgroundImageView;
    ///底部分割线
    UIView *_bottomLine;
}

@end

@implementation ZLNavigationBackgroundBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self effectView];
        [self bottomLine];
    }
    return self;
}

#pragma mark - Set
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.effectView.frame = self.bounds;
    self.backgroundImageView.frame = self.bounds;
    self.bottomLine.frame = CGRectMake(0, self.bounds.size.height - ZL_Line_Size_Height, ZL_Screen_Size.width, ZL_Line_Size_Height);
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.backgroundImageView.backgroundColor = backgroundColor;
    if (CGColorEqualToColor(backgroundColor.CGColor, UIColor.clearColor.CGColor)) {
        self.effectView.hidden = NO;
    }else {
        self.effectView.hidden = YES;
    }
}

#pragma mark - Lazy
- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:effect];
        view.frame = self.bounds;
        [self addSubview:view];
        _effectView = view;
    }
    return _effectView;
}
- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        _backgroundImageView = imageView;
    }
    return _backgroundImageView;
}
- (UIView *)bottomLine {
    if (!_bottomLine) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - ZL_Line_Size_Height, ZL_Screen_Size.width, ZL_Line_Size_Height)];
        view.backgroundColor = ZL_line_color;
        [self.backgroundImageView addSubview:view];
        _bottomLine = view;
    }
    return _bottomLine;
}

#pragma mark - Action
- (void)reset {
    self.bottomLine.backgroundColor = ZL_line_color;
    self.backgroundColor = UIColor.clearColor;
    self.backgroundImageView.image = nil;
}

@end
