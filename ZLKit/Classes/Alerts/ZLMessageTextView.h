//
//  ZLMessageTextView.h
//  BasisProject
//
//  Created by zhaolei on 2019/1/1.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLMessageTextView : UIView

/**展示提示信息
 @param message 提示语
 @param backgroundColor 背景色  默认黑色
 @param blocking 是否阻断用户操作
 @param view 父视图  默认window
 */
+ (void)showMessage:(NSString *)message BackgroundColor:(UIColor * _Nullable)backgroundColor Blocking:(BOOL)blocking SuperView:( UIView * _Nullable)view;

@end

NS_ASSUME_NONNULL_END
