//
//  ZLImage.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLImage : UIImage

///修改纯色图标的颜色
- (UIImage *)imageWithColor:(UIColor *)color;

///通过路径加载图片(加载主工程内的图片)
+ (ZLImage *)imagePathNamed:(NSString *)pathNamed fixScale:(BOOL)fix;

///加载当前bundle内的图片（如果你的图片不是放在主工程内，可以试试这个方式）
+ (ZLImage *)imageInCurrentBundlePathNamed:(NSString *)pathNamed;

@end

NS_ASSUME_NONNULL_END
