//
//  NSJSONSerialization+ZLCustom.h
//  ZLKit
//
//  Created by 赵磊 on 2019/3/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (ZLCustom)

/**加载指定bundle内的json文件
 *@param fileName 文件名（只要名称即可，不需要给类型后缀）
 *@param bundleName 为空表示当前bundle内的
 */
+ (id)mutableContainersWithJsonFileName:(NSString *)fileName BundleName:(NSString * _Nullable)bundleName;

@end

NS_ASSUME_NONNULL_END
