//
//  ZLKitHeader.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#ifndef ZLKitHeader_h
#define ZLKitHeader_h

#import "UIView+ZLCustom.h"
#import "UIColor+ZLCustom.h"
#import "NSString+ZLCustom.h"

#import "ZLTimerManager.h"
#import "ZLTemplateManger.h"

#import "ZLImage.h"
#import "ZLLabel.h"
#import "ZLImageView.h"
#import "ZLButton.h"
#import "ZLTextField.h"
#import "ZLKeyboardMoneyField.h"
#import "ZLTextView.h"
#import "ZLWebView.h"
#import "ZLScrollView.h"
#import "ZLTableView.h"
#import "ZLCollectionView.h"

#import "ZLErrorTextView.h"
#import "ZLWarnView.h"

///屏幕的尺寸
#define ZL_Screen_Size UIScreen.mainScreen.bounds.size
///弱引用本类对象
#define ZL_Weak_Self(weakSelf) __weak typeof(self)weakSelf = self
///弱引用指定对象
#define ZL_Weak_Object(object,weakObject) __weak typeof(object)weakObject = object
///齐刘海设备
#define ZL_Discern_Bang_Device(isBangDevice) BOOL isBangDevice = NO;if (@available(iOS 11.0, *)) {isBangDevice = UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom;}
///导航栏高度
#define ZL_Navigation_Height(navigationHeight,isBangDevice) ZL_Discern_Bang_Device(isBangDevice);CGFloat navigationHeight = isBangDevice ? 84.0 : 64.0;
///标签栏高度
#define ZL_Tabbar_Height(tabbarHeight,isBangDevice) ZL_Discern_Bang_Device(isBangDevice);CGFloat tabbarHeight = isBangDevice ? 83.0 : 49.0;
///齐刘海桌面返回条的高度
#define ZL_Home_Bar_Height(homeBarHeight,isBangDevice) ZL_Discern_Bang_Device(isBangDevice);CGFloat homeBarHeight = isBangDevice ? 30.0 : 0.01;

#define ZL_Not_Reachable_Message @"请求失败，请检查您的网络设置。"

#endif /* ZLKitHeader_h */
