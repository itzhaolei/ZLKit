//
//  ZLNavigationBar.m
//  Pods-ZLNavigationBar_Example
//
//  Created by zhaolei on 2018/12/26.
//

#import "ZLNavigationBar.h"
#import "ZLNavigationBarPrivateHeader.h"

@interface ZLNavigationBar ()

{
    ///背景层
    ZLNavigationBackgroundBar *_backgroundBar;
    ///事件层
    ZLNavigationActionBar *_actionBar;
}

/**事件条的跟随动作
 *功能描述：当本类对象初始化结束后，如果因事件需要导航栏的高度发生改变，那么事件条是会自动进行调整的（自动贴着底部运动）
 *赋值含义：YES:自动跟随   NO:终止跟随
 */
@property (nonatomic,unsafe_unretained,) BOOL isAllowActionBarAutomaticFollowBottom;

@end

@implementation ZLNavigationBar

///工厂方法
+ (instancetype)navigationBar {
    return [[self alloc] init];
}

///还原初始化
- (void)reset {
    self.clipsToBounds = YES;
    self.isAllowActionBarAutomaticFollowBottom = YES;
    ZL_Navigation_Height(navigationHeight);
    self.frame = CGRectMake(0, 0, ZL_Screen_Size.width, navigationHeight);
    [self.backgroundBar reset];
    [self.actionBar reset];
    for (UIView *subView in self.subviews) {
        if (![subView isKindOfClass:[ZLNavigationBackgroundBar class]]
            && ![subView isKindOfClass:[ZLNavigationActionBar class]]) {
            [subView removeFromSuperview];
        }
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        ZL_Navigation_Height(navigationHeight);
        self.isAllowActionBarAutomaticFollowBottom = YES;
        self.frame = CGRectMake(0, 0, ZL_Screen_Size.width, navigationHeight);
        [self backgroundBar];
        [self actionBar];
    }
    return self;
}

#pragma mark - Set
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.backgroundBar.frame = self.bounds;
    if (self.isAllowActionBarAutomaticFollowBottom) {
        self.isAllowActionBarAutomaticFollowBottom = NO;
        self.actionBar.frame = CGRectMake(0, self.bounds.size.height - ZL_Action_Bar_Height - ZL_Bottom_Space_Height, self.bounds.size.width, ZL_Action_Bar_Height);
    }
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.backgroundBar.backgroundColor = backgroundColor;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.actionBar.titleView.title = title;
}
- (void)setBackgroundImage:(UIImage *)backgroundImage {
    self.backgroundBar.backgroundImageView.image = backgroundImage;
}

#pragma mark - Lazy
- (ZLNavigationBackgroundBar *)backgroundBar {
    if (!_backgroundBar) {
        ZLNavigationBackgroundBar *view = [[ZLNavigationBackgroundBar alloc] initWithFrame:self.bounds];
        [self addSubview:view];
        _backgroundBar = view;
    }
    return _backgroundBar;
}
- (ZLNavigationActionBar *)actionBar {
    if (!_actionBar) {
        ZLNavigationActionBar *view = [[ZLNavigationActionBar alloc] initWithFrame:CGRectZero];
        [self addSubview:view];
        _actionBar = view;
    }
    return _actionBar;
}

@end
