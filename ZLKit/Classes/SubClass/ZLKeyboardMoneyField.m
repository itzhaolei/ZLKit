//
//  ZLKeyboardMoneyBar.m
//  BulgeSeekUserPort
//
//  Created by zhaolei on 2018/10/30.
//  Copyright © 2018年 赵磊. All rights reserved.
//

#define zl_KeyboardMoneyScale(value) UIScreen.mainScreen.bounds.size.width / 375.0 * value
///齐刘海设备
#define ZL_Discern_Bang_Device(isBangDevice) BOOL isBangDevice = NO;if (@available(iOS 11.0, *)) {isBangDevice = UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom;}

#import "ZLKeyboardMoneyField.h"

@interface ZLKeyboardMoneyField ()

///单元视图
@property (nonatomic,strong) UIView *unitView;
///确定
@property (nonatomic,strong) UIButton *doneButton;

@end

@implementation ZLKeyboardMoneyField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.inputView = self.unitView;
        [self becomeFirstResponder];
    }
    return self;
}

#pragma mark - Lazy
- (UIView *)unitView {
    if (!_unitView) {
        ZL_Discern_Bang_Device(isBangDevice);
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, zl_KeyboardMoneyScale(217.0) + (isBangDevice ? 25.0 : 0))];
        view.backgroundColor = [UIColor colorWithRed:239.0 / 255.0 green:239.0 / 255.0 blue:244.0 / 255.0 alpha:1.0];
        
        NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@"",@"",@"确定"];
        
        CGFloat width =  zl_KeyboardMoneyScale(90.0) - 1.0;
        CGFloat height = (zl_KeyboardMoneyScale(217.0) - 4.0) / 4;
        for (NSInteger index = 0; index < array.count; index++) {
            CGRect frame = CGRectZero;
            if (index == array.count - 1) {
                frame = CGRectMake(zl_KeyboardMoneyScale(270.0), zl_KeyboardMoneyScale(217.0) / 2.0 + 1.0, UIScreen.mainScreen.bounds.size.width - zl_KeyboardMoneyScale(270.0), zl_KeyboardMoneyScale(217.0) / 2.0 - 1.0);
            }else if (index == array.count - 2) {
                frame = CGRectMake(zl_KeyboardMoneyScale(270.0), 1.0, UIScreen.mainScreen.bounds.size.width - zl_KeyboardMoneyScale(270.0), zl_KeyboardMoneyScale(217.0) / 2.0 - 1.0);
            }else {
                frame = CGRectMake((width + 1.0) * (index % 3), 1.0 + (height + 1.0) * (index / 3), width, height);
            }
            UIButton *button = [[UIButton alloc] initWithFrame:frame];
            button.backgroundColor = UIColor.whiteColor;
            
            if (index == array.count - 1) {
                [button setTitle:array[index] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:22.0];
                [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
                [button addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
                button.backgroundColor = [UIColor colorWithRed:217.0 / 255.0 green:217.0 / 255.0 blue:222.0 / 255.0 alpha:1.0];
                button.enabled = NO;
                self.doneButton = button;
            }else if (index == array.count - 2) {
                NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
                NSString *path = [currentBundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"ZLKit.bundle/ZLKit_Delete@%dx.png",(int)UIScreen.mainScreen.scale]];
                [button setImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
            }else if (index == array.count - 3) {
                NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
                NSString *path = [currentBundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"ZLKit.bundle/ZLKit_ Close Keyboard@%dx.png",(int)UIScreen.mainScreen.scale]];
                [button setImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
            }else {
                [button setTitle:array[index] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
                [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
                [button addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            [view addSubview:button];
        }
        
        _unitView = view;
    }
    return _unitView;
}

#pragma mark - Action
- (void)itemAction:(UIButton *)sender {
    sender.backgroundColor = [UIColor colorWithRed:200.0 / 255.0 green:200.0 / 255.0 blue:205.0 / 255.0 alpha:1.0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.backgroundColor = UIColor.whiteColor;
    });
    if ([sender.titleLabel.text isEqualToString:@"."] && [self.text rangeOfString:@"."].location != NSNotFound) {
        return;
    }
    NSInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:self.selectedTextRange.start];
    if ([self.text rangeOfString:@"."].location != NSNotFound) {
        NSArray *numberArray = [self.text componentsSeparatedByString:@"."];
        if (((NSString *)numberArray.lastObject).length >= 2 && location > ((NSString *)numberArray.firstObject).length) {
            return;
        }
    }
    NSString *importString = sender.titleLabel.text;
    if ([importString isEqualToString:@"."] && location == 0) {
        importString = @"0.";
    }
    self.text = [self.text stringByReplacingCharactersInRange:NSMakeRange(location, 0) withString:importString];
    //修改光标位置
    UITextPosition *begin = self.beginningOfDocument;
    UITextPosition *start = [self positionFromPosition:begin offset:0];
    UITextRange *range = [self textRangeFromPosition:start toPosition:start];
    [self setSelectedTextRange:range];
    //修改偏移量
    UITextRange *selectedRange = [self selectedTextRange];
    NSInteger currentOffset = [self offsetFromPosition:self.endOfDocument toPosition:selectedRange.end];
    currentOffset += (location + importString.length);
    UITextPosition *newPos = [self positionFromPosition:self.endOfDocument offset:currentOffset];
    self.selectedTextRange = [self textRangeFromPosition:newPos toPosition:newPos];
    [self didChangedTextAction];
}
- (void)deleteAction:(UIButton *)sender {
    sender.backgroundColor = [UIColor colorWithRed:200.0 / 255.0 green:200.0 / 255.0 blue:205.0 / 255.0 alpha:1.0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.backgroundColor = UIColor.whiteColor;
    });
    NSInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:self.selectedTextRange.start];
    if (self.text.length > 0 && location > 0) {
        self.text = [self.text stringByReplacingCharactersInRange:NSMakeRange(location - 1, 1) withString:@""];
        //修改光标位置
        UITextPosition *begin = self.beginningOfDocument;
        UITextPosition *start = [self positionFromPosition:begin offset:0];
        UITextRange *range = [self textRangeFromPosition:start toPosition:start];
        [self setSelectedTextRange:range];
        //修改偏移量
        UITextRange *selectedRange = [self selectedTextRange];
        NSInteger currentOffset = [self offsetFromPosition:self.endOfDocument toPosition:selectedRange.end];
        currentOffset += (location - 1);
        UITextPosition *newPos = [self positionFromPosition:self.endOfDocument offset:currentOffset];
        self.selectedTextRange = [self textRangeFromPosition:newPos toPosition:newPos];
        [self didChangedTextAction];
    }
}
- (void)closeAction {
    [self resignFirstResponder];
}
- (void)doneAction {
    if (self.done) {
        self.done();
    }
    [self resignFirstResponder];
}
- (void)didChangedTextAction {
    if (self.didChangedText) {
        self.didChangedText(self.text);
    }
    if (self.text.length > 0) {
        self.doneButton.backgroundColor = UIColor.redColor;
        self.doneButton.enabled = YES;
    }else {
        self.doneButton.backgroundColor = [UIColor colorWithRed:217.0 / 255.0 green:217.0 / 255.0 blue:222.0 / 255.0 alpha:1.0];
        self.doneButton.enabled = NO;
    }
}

#pragma mark - Rewrite
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

@end
