//
//  ZLNavigationBarPrivateHeader.h
//  Pods
//
//  Created by zhaolei on 2018/12/26.
//

#ifndef ZLNavigationBarPrivateHeader_h
#define ZLNavigationBarPrivateHeader_h


//TODO:配置
///按钮的宽度
#define ZL_Item_Size_Width 50.0
///事件条的高度
#define ZL_Action_Bar_Height 40.0
///分割线的高度
#define ZL_Line_Size_Height 0.5
///底部空间预留高度
#define ZL_Bottom_Space_Height 4.0


//TODO:颜色
///分割线
#define ZL_line_color [UIColor colorWithWhite:227 / 255.0 alpha:1.0]
///文字黑色
#define ZL_Text_Black_color [UIColor colorWithWhite:51 / 255.0 alpha:1.0]


//TODO:缩写
///屏幕的尺寸
#define ZL_Screen_Size UIScreen.mainScreen.bounds.size
///齐刘海设备
#define ZL_Discern_Bang_Device(isBangDevice) BOOL isBangDevice = NO;if (@available(iOS 11.0, *)) {isBangDevice = UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom;}
///导航栏高度
#define ZL_Navigation_Height(navigationHeight) ZL_Discern_Bang_Device(isBangDevice);CGFloat navigationHeight = isBangDevice ? 84.0 : 64.0;

//TODO:字符
#define ZL_Type_Mismatch_ERROR @"\n\nERROR:类型不匹配\nZLNavigationBar.h中接收到的actionView属性值不符合要求，\n请查看该视图是否是UIScrollView类或是其派生类\n\n."


#endif /* ZLNavigationBarPrivateHeader_h */
