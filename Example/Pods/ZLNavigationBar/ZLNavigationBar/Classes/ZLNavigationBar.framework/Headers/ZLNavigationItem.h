//
//  ZLNavigationLeftItem.h
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLNavigationItem : UIButton

///图片名 <用于加载Images.xcassets内的图片>
@property (nonatomic,strong,readwrite) NSString *imageName;
///图片名 <用于加载目录下的图片，通过路径加载，格式为xx.png/xx.jpg/xx.jpeg>
@property (nonatomic,strong,readwrite) NSString *imageFileName;

///点击事件
@property (nonatomic,copy) void (^click)(void);

///为本类对象设置默认的返回图标
- (void)setupDefaultGobackImage;

@end

NS_ASSUME_NONNULL_END
