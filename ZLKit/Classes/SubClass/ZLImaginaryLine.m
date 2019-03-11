//
//  ZLImaginaryLine.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLImaginaryLine.h"
#import "ZLTemplateManger.h"

@implementation ZLImaginaryLine

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext, templateManger.lineColor.CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1.0);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, self.frame.size.width / 2, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext, self.frame.size.width / 2, self.frame.size.height);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {2.0,2.0};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 1);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
