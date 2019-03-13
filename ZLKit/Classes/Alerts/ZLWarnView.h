//
//  ZLWarnView.h
//  BulgeSeekUserPort
//
//  Created by zhaolei on 2018/8/6.
//  Copyright © 2018年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLWarnView : UIView

///展示提示信息
+ (void)showErrorMessageOnView:(UIView *)view Message:(NSString *)message;

@end
