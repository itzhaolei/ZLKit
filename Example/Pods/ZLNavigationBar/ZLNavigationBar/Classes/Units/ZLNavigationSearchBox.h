//
//  ZLNavigationSearchBox.h
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLNavigationSearchBox : UITextField

///点击事件（当该block被实现时，无法进行输入操作，只会调用该block）
@property (nonatomic,copy,nullable) void (^click)(void);
///实时搜索（高频）
@property (nonatomic,copy) void (^realtimeSearch)(NSString *keyString);
///确认搜索（点击键盘中的done时触发）
@property (nonatomic,copy) void (^sureSearch)(NSString *keyString);
///确定按钮
@property (nonatomic,weak,readonly) UIButton *doneButton;

@end

NS_ASSUME_NONNULL_END
