//
//  ZLKeyboardMoneyBar.h
//  BulgeSeekUserPort
//
//  Created by zhaolei on 2018/10/30.
//  Copyright © 2018年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLKeyboardMoneyField : UITextField

///确定
@property (nonatomic,copy) void (^done)(void);
///改变文字时调用
@property (nonatomic,copy) void (^didChangedText)(NSString *string);

@end
