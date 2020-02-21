//
//  ZLNavigationTransparencyManager.h
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLNavigationTransparencyManager : NSObject

///需要被检测的滑动视图
@property (nonatomic,weak,readwrite) UIScrollView *actionView;
///渐变空间的高度
@property (nonatomic,unsafe_unretained,readwrite) CGFloat transparencySpecHeight;
///临界点的事件
@property (nonatomic,copy,readwrite) void (^action)(BOOL didEndAppear);

@end

NS_ASSUME_NONNULL_END
