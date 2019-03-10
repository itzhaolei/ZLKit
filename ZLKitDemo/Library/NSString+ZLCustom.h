//
//  NSString+ZLCustom.h
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/10.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZLCustom)

/**根据矩形内文字的属性计算文字宽高
 
 NSFontAttributeName : 字号（UIFont类型）
 
 NSForegroundColorAttributeName : 文字颜色（UIColor类型）
 
 NSKernAttributeName : 文字间距（NSNumber类型）
 
 NSKernAttributeName : 文字间距（NSNumber类型）
 
 NSParagraphStyleAttributeName : 文字行间距、段落间距（NSMutableParagraphStyle类型）
 
 NSStrikethroughStyleAttributeName : 中划线（NSNumber类型  NSUnderlineStyleSingle单细线、NSUnderlineStyleThick单粗线、NSUnderlineStyleDouble双线）
 */
- (CGSize)size:(CGSize)size Attributes:(NSDictionary *)attributes;

///MD5加密 32位 小写
- (instancetype)MD5For32Bate;
///MD5加密 32位 大写
- (NSString *)MD5ForUpper32Bate;
///MD5加密 16位 大写
- (NSString *)MD5ForUpper16Bate;

///将链接中的中文编译成英文
- (NSString *)changeChinese;

/**将一段文字中的系统Emoji表情转换成文本
 
 警告不用管、是为了适配9.0之前的系统
 */
- (instancetype)emojiExpressionConversionText;


/**将将一段文字中的系统Emoji文本占位恢复成表情
 
 警告不用管、是为了适配9.0之前的系统
 */
- (instancetype)textConversionEmojiExpression;

@end

NS_ASSUME_NONNULL_END
