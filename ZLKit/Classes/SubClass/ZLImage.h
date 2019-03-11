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

@end

NS_ASSUME_NONNULL_END
