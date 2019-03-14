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

/**加载指定bundle内的图片
 *@param pathNamed 图片名（只要名称即可，不需要给类型后缀，不需要给倍数）
 *@param bundleName 为空表示当前bundle内的图片
 */
+ (ZLImage *)imageInCurrentBundlePathNamed:(NSString *)pathNamed BundleName:(NSString * _Nullable)bundleName;

@end

NS_ASSUME_NONNULL_END
