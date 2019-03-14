//
//  NSJSONSerialization+ZLCustom.m
//  ZLKit
//
//  Created by 赵磊 on 2019/3/14.
//

#import "NSJSONSerialization+ZLCustom.h"

@implementation NSJSONSerialization (ZLCustom)

/**加载指定bundle内的json文件
 *@param fileName 文件名（只要名称即可，不需要给类型后缀）
 *@param bundleName 为空表示当前bundle内的
 */
+ (id)mutableContainersWithJsonFileName:(NSString *)fileName BundleName:(NSString * _Nullable)bundleName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    bundleName = bundleName ? bundleName : [[currentBundle.resourcePath componentsSeparatedByString:@"/"].lastObject componentsSeparatedByString:@"."].firstObject;
    fileName = [NSString stringWithFormat:@"%@.bundle/%@.json",bundleName,fileName];
    NSString *filePath = [currentBundle.resourcePath stringByAppendingPathComponent:fileName];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    return [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
}

@end
