//
//  ZLNavigationTransparencyManager.m
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/30.
//

#import "ZLNavigationTransparencyManager.h"
#import "ZLNavigationBarPrivateHeader.h"

@interface ZLNavigationTransparencyManager ()

///被展示时锁定只调用一次
@property (nonatomic,unsafe_unretained) BOOL lockShow;
///被隐藏时锁定只调用一次
@property (nonatomic,unsafe_unretained) BOOL lockDismiss;
///导航栏的背景层
@property (nonatomic,weak) UIView *view;

@end

@implementation ZLNavigationTransparencyManager

- (void)dealloc {
    [_actionView removeObserver:self forKeyPath:@"contentOffset"];
}
- (instancetype)init {
    if (self = [super init]) {
        ZL_Navigation_Height(navigationHeight);
        self.transparencySpecHeight = navigationHeight;
    }
    return self;
}

#pragma mark - Set
- (void)setActionView:(UIScrollView *)actionView {
    _actionView = actionView;
    if ([actionView isKindOfClass:[UIScrollView class]]) {
        [actionView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew) context:nil];
        return;
    }
    NSLog(ZL_Type_Mismatch_ERROR);
}

#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    UIScrollView *scrollView = (UIScrollView *)object;
    CGFloat offSetY = scrollView.contentOffset.y;
    CGFloat alpha = (offSetY <= 0) ? 0 : offSetY / ((CGFloat)self.transparencySpecHeight);
    alpha = alpha >= 1.0 ? 1.0 : alpha;
    self.view.alpha = alpha;
    //加锁锁频
    if (alpha == 1.0) {
        if (!self.lockShow) {
            self.lockShow = YES;
            self.lockDismiss = NO;
            if (self.action) {
                self.action(YES);
            }
        }
    }else {
        if (!self.lockDismiss) {
            self.lockDismiss = YES;
            self.lockShow = NO;
            if (self.action) {
                self.action(NO);
            }
        }
    }
}

@end
