//
//  NSJSONSerialization+ZLCustom.h
//  ZLKit
//
//  Created by 赵磊 on 2019/3/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (ZLCustom)

/**加载MainBundle内的json文件
 *@param fileName 文件名（只要名称即可，不需要给类型后缀）
 */
+ (id)mutableContainersWithMainBundleJsonFileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
