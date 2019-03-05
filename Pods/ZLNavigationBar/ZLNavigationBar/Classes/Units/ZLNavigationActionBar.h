//
//  ZLNavigationActionBar.h
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import "ZLNavigationItem.h"
#import "ZLNavigationTitleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLNavigationActionBar : UIView

///左边的按钮
@property (nonatomic,weak,readonly) ZLNavigationItem *leftItem;
///右边的主按钮
@property (nonatomic,weak,readonly) ZLNavigationItem *rightMainItem;
///右边的辅助按钮
@property (nonatomic,weak,readonly) ZLNavigationItem *rightAssistItem;
///标题视图
@property (nonatomic,weak,readonly) ZLNavigationTitleView *titleView;

///还原初始化
- (void)reset;

@end

NS_ASSUME_NONNULL_END
