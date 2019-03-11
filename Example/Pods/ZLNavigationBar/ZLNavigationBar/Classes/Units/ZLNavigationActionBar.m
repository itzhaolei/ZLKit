//
//  ZLNavigationActionBar.m
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import "ZLNavigationActionBar.h"
#import "ZLNavigationBarPrivateHeader.h"

@interface ZLNavigationActionBar ()

{
    ///左边的按钮
    ZLNavigationItem *_leftItem;
    ///右边的主按钮
    ZLNavigationItem *_rightMainItem;
    ///右边的辅助按钮
    ZLNavigationItem *_rightAssistItem;
    ///标题视图
    ZLNavigationTitleView *_titleView;
};

///是否已经加载右边的辅助按钮
@property (nonatomic,unsafe_unretained) BOOL didLoadRightAssistItem;
///是否已经加载标题视图
@property (nonatomic,unsafe_unretained) BOOL didLoadTitleView;

@end

@implementation ZLNavigationActionBar

#pragma mark - Lazy
- (ZLNavigationItem *)leftItem {
    if (!_leftItem) {
        ZLNavigationItem *leftItem = [[ZLNavigationItem alloc] initWithFrame:CGRectMake(0, 0, ZL_Item_Size_Width, ZL_Action_Bar_Height)];
        [leftItem setupDefaultGobackImage];
        [self addSubview:leftItem];
        _leftItem = leftItem;
    }
    return _leftItem;
}
- (ZLNavigationItem *)rightMainItem {
    if (!_rightMainItem) {
        ZLNavigationItem *rightMainItem = [[ZLNavigationItem alloc] initWithFrame:CGRectMake(self.superview.frame.size.width - ZL_Item_Size_Width, 0, ZL_Item_Size_Width, ZL_Action_Bar_Height)];
        [self addSubview:rightMainItem];
        _rightMainItem = rightMainItem;
    }
    return _rightMainItem;
}
- (ZLNavigationItem *)rightAssistItem {
    if (!_rightAssistItem) {
        ZLNavigationItem *rightAssistItem = [[ZLNavigationItem alloc] initWithFrame:CGRectMake(self.superview.frame.size.width - ZL_Item_Size_Width * 2, 0, ZL_Item_Size_Width, ZL_Action_Bar_Height)];
        self.didLoadRightAssistItem = YES;
        if (self.didLoadTitleView) {
            self.titleView.frame = CGRectMake(ZL_Item_Size_Width * 2, 0, self.superview.frame.size.width - ZL_Item_Size_Width * 4, ZL_Action_Bar_Height);
        }
        [self addSubview:rightAssistItem];
        _rightAssistItem = rightAssistItem;
    }
    return _rightAssistItem;
}
- (ZLNavigationTitleView *)titleView {
    if (!_titleView) {
        CGRect frame = CGRectMake(ZL_Item_Size_Width, 0, self.superview.frame.size.width - ZL_Item_Size_Width * 2, ZL_Action_Bar_Height);
        if (self.didLoadRightAssistItem) {
            frame = CGRectMake(ZL_Item_Size_Width * 2, 0, self.superview.frame.size.width - ZL_Item_Size_Width * 4, ZL_Action_Bar_Height);
        }
        ZLNavigationTitleView *titleView = [[ZLNavigationTitleView alloc] initWithFrame:frame];
        self.didLoadTitleView = YES;
        [self addSubview:titleView];
        _titleView = titleView;
    }
    return _titleView;
}

#pragma mark - Action
- (void)reset {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
