//
//  ZLNavigationTitleView.h
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import "ZLNavigationSearchBox.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLNavigationTitleView : UIView

///标题
@property (nonatomic,strong) NSString *title;
///标题视图
@property (nonatomic,weak,readonly) UILabel *titleLabel;
///搜索框
@property (nonatomic,weak,readonly) ZLNavigationSearchBox *searchBox;

@end

NS_ASSUME_NONNULL_END
