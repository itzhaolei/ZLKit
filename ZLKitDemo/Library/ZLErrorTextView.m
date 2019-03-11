//
//  ZLErrorTextView.m
//  BasisProject
//
//  Created by zhaolei on 2019/1/1.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLErrorTextView.h"
#import "ZLKitHeader.h"

@implementation ZLErrorTextView

///展示错误提示
+ (void)showError:(NSString *)error BackgroundColor:(UIColor * _Nullable)backgroundColor SuperView:( UIView * _Nullable)view {
    view = view ? view : UIApplication.sharedApplication.delegate.window;
    BOOL blockingOperation = NO;
    
    CGFloat maxWidth = ZL_Screen_Size.width - 130.0;
    CGSize size = [error boundingRectWithSize:CGSizeMake(maxWidth,MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil].size;
    CGFloat width = (size.height > 18.0 ? maxWidth : size.width) + 30.0;
    CGFloat height = size.height + 20.0;
    
    CGRect frame = CGRectZero;
    if (blockingOperation) {
        frame = view.bounds;
    }else {
        frame = CGRectMake((ZL_Screen_Size.width - width) / 2.0, (ZL_Screen_Size.height - height) / 2.0, width, height);
    }
    ZLErrorTextView *unitView = [[ZLErrorTextView alloc] initWithFrame:frame];
    [view addSubview:unitView];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((unitView.frame.size.width - width) / 2.0, (unitView.frame.size.height - height) / 2.0, width, height)];
    [button setTitle:error forState:UIControlStateNormal];
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
