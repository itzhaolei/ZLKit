//
//  ZLWarnView.m
//  BulgeSeekUserPort
//
//  Created by zhaolei on 2018/8/6.
//  Copyright © 2018年 赵磊. All rights reserved.
//

///齐刘海设备
#define ZL_Discern_Bang_Device(isBangDevice) BOOL isBangDevice = NO;if (@available(iOS 11.0, *)) {isBangDevice = UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom;}

#import "ZLWarnView.h"
#import "ZLTemplateManger.h"

@interface ZLWarnView ()

///图标
@property (nonatomic,weak) UIButton *iconButton;
///文本
@property (nonatomic,weak) UILabel *titleLabel;
///底部分割线
@property (nonatomic,weak) CALayer *bottomLine;
///动画时长
@property (nonatomic,unsafe_unretained,readonly) CGFloat animateTime;
///延迟时长
@property (nonatomic,unsafe_unretained,readonly) CGFloat delayTime;
///打断延迟消失
@property (nonatomic,unsafe_unretained) BOOL breakDismiss;
///正在进行动画
@property (nonatomic,unsafe_unretained) BOOL onAnimation;

@end

@implementation ZLWarnView

#pragma mark - Config
///动画时长
- (CGFloat)animateTime {
    return 0.25;
}
///延迟时间
- (CGFloat)delayTime {
    return 1.5;
}

#pragma mark - Public
+ (void)showErrorMessageOnView:(UIView *)view Servicer:(BOOL)servicer Message:(NSString *)message {
    view = view ? view : UIApplication.sharedApplication.delegate.window;
    if ([ZLWarnView shared].superview) {
        return;
    }
    CGFloat width = [message boundingRectWithSize:CGSizeMake(MAXFLOAT,MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[ZLWarnView shared].titleLabel.font} context:nil].size.width;
    BOOL doubleRow = width > [ZLWarnView shared].titleLabel.frame.size.width ? YES : NO;
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [currentBundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"ZLKit.bundle/%@@%dx.png",!servicer ? @"ZLKit_Warning" : @"ZLKit_Error",(int)UIScreen.mainScreen.scale]];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    [[ZLWarnView shared].iconButton setImage:image forState:UIControlStateNormal];
    if (doubleRow) {
        [ZLWarnView shared].iconButton.frame = CGRectMake([ZLWarnView shared].iconButton.frame.origin.x, [ZLWarnView shared].frame.size.height - 40.0, [ZLWarnView shared].iconButton.frame.size.width, 20.0);
    }else {
        [ZLWarnView shared].iconButton.frame = CGRectMake([ZLWarnView shared].iconButton.frame.origin.x, [ZLWarnView shared].frame.size.height - 44.0, [ZLWarnView shared].iconButton.frame.size.width, 40.0);
    }
    if ([ZLWarnView shared].onAnimation) {
        [ZLWarnView shared].titleLabel.text = message;
        return;
    }
    [ZLWarnView shared].titleLabel.text = message;
    [view addSubview:[ZLWarnView shared]];
    [ZLWarnView shared].frame = CGRectMake(0, -[ZLWarnView shared].frame.size.height, UIScreen.mainScreen.bounds.size.width, [ZLWarnView shared].frame.size.height);
    [UIView animateWithDuration:[ZLWarnView shared].animateTime animations:^{
        [ZLWarnView shared].frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, [ZLWarnView shared].frame.size.height);
    } completion:^(BOOL finished) {
        [ZLWarnView shared].onAnimation = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([ZLWarnView shared].delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (![ZLWarnView shared].breakDismiss) {
                [[ZLWarnView shared] dismiss];
            }
            [ZLWarnView shared].onAnimation = NO;
        });
    }];
}

#pragma mark - Private
+ (instancetype)shared {
    static ZLWarnView *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithFrame:CGRectZero];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:manager action:@selector(tapAction)];
        [manager addGestureRecognizer:tapGestureRecognizer];
        manager.backgroundColor = UIColor.whiteColor;
        CGFloat height = 0;
        
        ZL_Discern_Bang_Device(isBangDevice);
        if (UIApplication.sharedApplication.statusBarFrame.size.height == 0) {
            if (isBangDevice) {
                height = UIApplication.sharedApplication.statusBarFrame.size.height;
            }else {
                height = 20.0;
            }
        }else {
            height = UIApplication.sharedApplication.statusBarFrame.size.height;
        }
        manager.frame = CGRectMake(0, -(height + 44.0), UIScreen.mainScreen.bounds.size.width, height + 44.0);
    });
    return manager;
}

#pragma mark - Lazy
- (UIButton *)iconButton {
    if (!_iconButton) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15.0, self.frame.size.height - 44.0, 24.0, 20.0)];
        button.userInteractionEnabled = NO;
        [self addSubview:button];
        _iconButton = button;
    }
    return _iconButton;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconButton.frame) + 10.0, self.frame.size.height - 44.0, UIScreen.mainScreen.bounds.size.width - CGRectGetMaxX(self.iconButton.frame) - 25.0, 40.0)];
        label.font = [UIFont systemFontOfSize:14.0];
        label.numberOfLines = 3;
        [self addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}
- (CALayer *)bottomLine {
    if (!_bottomLine) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, [ZLWarnView shared].frame.size.height - 0.5, UIScreen.mainScreen.bounds.size.width, 0.5);
        layer.backgroundColor = templateManger.lineColor.CGColor;
        [self.layer addSublayer:layer];
        _bottomLine = layer;
    }
    return _bottomLine;
}

#pragma mark - Action
- (void)tapAction {
    self.breakDismiss = YES;
    [self dismiss];
}
- (void)dismiss {
    [UIView animateWithDuration:self.animateTime animations:^{
        self.frame = CGRectMake(0, -self.frame.size.height, UIScreen.mainScreen.bounds.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.breakDismiss = NO;
    }];
}

@end
