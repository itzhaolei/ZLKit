//
//  ZLImage.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLImage.h"

@implementation ZLImage

///修改纯色图标的颜色
- (UIImage *)imageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

///通过路径加载图片
+ (ZLImage *)imagePathNamed:(NSString *)pathNamed fixScale:(BOOL)fix {
    NSString *imageName = [NSString stringWithFormat:@"%@@%.0fx.png",pathNamed,UIScreen.mainScreen.scale];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:imagePath];
    return (ZLImage *)(fix ? [ZLImage imageWithData:data scale:UIScreen.mainScreen.scale] : [ZLImage imageWithData:data]);
}

///加载当前bundle内的图片（如果你的图片不是放在主工程内，可以试试这个方式）
+ (ZLImage *)imageInCurrentBundlePathNamed:(NSString *)pathNamed BundleName:(NSString * _Nullable)bundleName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    bundleName = bundleName ? bundleName : [[currentBundle.resourcePath componentsSeparatedByString:@"/"].lastObject componentsSeparatedByString:@"."].firstObject;
    NSString *imageName = [NSString stringWithFormat:@"%@.bundle/%@@%dx.png",bundleName,pathNamed,(int)UIScreen.mainScreen.scale];
    NSString *imagePath = [currentBundle.resourcePath stringByAppendingPathComponent:imageName];
    return (ZLImage *)[ZLImage imageWithContentsOfFile:imagePath];
}

@end
