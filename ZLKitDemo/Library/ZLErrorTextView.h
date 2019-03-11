//
//  ZLErrorTextView.h
//  BasisProject
//
//  Created by zhaolei on 2019/1/1.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLErrorTextView : UIView

///展示错误提示
+ (void)showError:(NSString *)error BackgroundColor:(UIColor * _Nullable)backgroundColor SuperView:( UIView * _Nullable)view;

@end

NS_ASSUME_NONNULL_END
