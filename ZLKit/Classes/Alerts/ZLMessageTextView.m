//
//  ZLMessageTextView.m
//  BasisProject
//
//  Created by zhaolei on 2019/1/1.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLMessageTextView.h"

@implementation ZLMessageTextView

/**展示提示信息
 @param message 提示语
 @param backgroundColor 背景色  默认黑色
 @param blocking 是否阻断用户操作
 @param view 父视图  默认window
 */
+ (void)showMessage:(NSString *)message BackgroundColor:(UIColor * _Nullable)backgroundColor Blocking:(BOOL)blocking SuperView:( UIView * _Nullable)view {
    view = view ? view : UIApplication.sharedApplication.delegate.window;
    BOOL blockingOperation = blocking;
    
    ZLMessageTextView *unitView = [[ZLMessageTextView alloc] initWithFrame:CGRectZero];
    [view addSubview:unitView];
    
    CGFloat maxWidth = UIScreen.mainScreen.bounds.size.width - 130.0;
    CGSize size = [message boundingRectWithSize:CGSizeMake(maxWidth,MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil].size;
    CGFloat width = (size.width > maxWidth ? maxWidth : size.width) + 30.0;
    CGFloat height = size.height + 20.0;
    
    if (blockingOperation) {
        unitView.frame = view.bounds;
    }else {
        unitView.frame = CGRectMake((UIScreen.mainScreen.bounds.size.width - width) / 2.0, (UIScreen.mainScreen.bounds.size.height - height) / 2.0, width, height);
        [view bringSubviewToFront:unitView];
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((unitView.frame.size.width - width) / 2.0, (unitView.frame.size.height - height) / 2.0, width, height)];
    [button setTitle:message forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 15.0, 0, 15.0);
    button.layer.cornerRadius = 3.0;
    button.layer.masksToBounds = YES;
    button.backgroundColor = [backgroundColor ? backgroundColor : UIColor.blackColor colorWithAlphaComponent:0.8];
    [unitView addSubview:button];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [unitView removeFromSuperview];
    });
}

@end
