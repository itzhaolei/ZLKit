//
//  NSJSONSerialization+ZLCustom.m
//  ZLKit
//
//  Created by 赵磊 on 2019/3/14.
//

#import "NSJSONSerialization+ZLCustom.h"

@implementation NSJSONSerialization (ZLCustom)

/**加载MainBundle内的json文件
 *@param fileName 文件名（只要名称即可，不需要给类型后缀）
 */
+ (id)mutableContainersWithMainBundleJsonFileName:(NSString *)fileName {
    NSString *path = [NSBundle.mainBundle pathForResource:[NSString stringWithFormat:@"%@.json",fileName] ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
}

@end
