//
//  NSString+ZLCustom.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/10.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "NSString+ZLCustom.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (ZLCustom)

/**根据矩形内文字的属性计算文字宽高
 
 NSFontAttributeName : 字号（UIFont类型）
 
 NSForegroundColorAttributeName : 文字颜色（UIColor类型）
 
 NSKernAttributeName : 文字间距（NSNumber类型）
 
 NSKernAttributeName : 文字间距（NSNumber类型）
 
 NSParagraphStyleAttributeName : 文字行间距、段落间距（NSMutableParagraphStyle类型）
 
 NSStrikethroughStyleAttributeName : 中划线（NSNumber类型  NSUnderlineStyleSingle单细线、NSUnderlineStyleThick单粗线、NSUnderlineStyleDouble双线）
 */
- (CGSize)size:(CGSize)size Attributes:(NSDictionary *)attributes {
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
}

///MD5加密 32位 小写
- (instancetype)MD5For32Bate {
    const char *input = [self UTF8String];
    unsigned char digest[16];
    CC_MD5(input,(CC_LONG)strlen(input),digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}
///MD5加密 32位 大写
- (NSString *)MD5ForUpper32Bate {
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return digest;
}
///MD5加密 16位 大写
- (NSString *)MD5ForUpper16Bate {
    NSString *md5Str = [self MD5ForUpper32Bate];
    NSString *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

///将链接中的中文编译成英文
- (NSString *)changeChinese {
    NSString *string = [self stringByReplacingOccurrencesOfString:@"\\\\" withString:@"\\"];
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    return [string stringByAddingPercentEncodingWithAllowedCharacters:set];
}

/**将一段文字中的系统Emoji表情转换成文本
 
 警告不用管、是为了适配9.0之前的系统
 */
- (instancetype)emojiExpressionConversionText {
    return ([[UIDevice currentDevice].systemVersion floatValue] < 9.0) ? [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] : [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
}

/**将将一段文字中的系统Emoji文本占位恢复成表情
 
 警告不用管、是为了适配9.0之前的系统
 */
- (instancetype)textConversionEmojiExpression {
    return ([[UIDevice currentDevice].systemVersion floatValue] < 9.0) ? [self  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] : [self stringByRemovingPercentEncoding];
}

@end
