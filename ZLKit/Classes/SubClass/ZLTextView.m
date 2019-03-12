//
//  ZLTextView.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLTextView.h"
#import "ZLTemplateManger.h"

@interface ZLTextView ()<UITextViewDelegate>

{
    ///工具条
    UIView *_inputAccessoryView;
    ///确定按钮
    UIButton *_doneButton;
}

///上一次输入的内容
@property (nonatomic,strong) NSString *lastText;

@end

@implementation ZLTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        //ios11 适配
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.scrollIndicatorInsets = self.contentInset;
        }
    }
    return self;
}

#pragma mark - Set
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font = self.font;
}
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
    [self.placeholderLabel sizeToFit];
    CGFloat height = self.placeholderLabel.frame.size.width > self.frame.size.width ? 35.0 : 16.0;
    self.placeholderLabel.frame = CGRectMake(5, 8.0, self.frame.size.width, height);
}

#pragma mark - Lazy
- (UIView *)inputAccessoryView {
    if (!_inputAccessoryView) {
        UIView *inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 35.0)];
        inputAccessoryView.backgroundColor = UIColor.whiteColor;
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 0.5);
        layer.backgroundColor = templateManger.lineColor.CGColor;
        [inputAccessoryView.layer addSublayer:layer];
        _inputAccessoryView = inputAccessoryView;
        [self doneButton];
    }
    return _inputAccessoryView;
}
- (UIButton *)doneButton {
    if (!_doneButton) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.inputAccessoryView.frame.size.width - 60.0, 0, 60.0, self.inputAccessoryView.frame.size.height)];
        [button setTitle:@"完成" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setTitleColor:templateManger.textBlackColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
        [self.inputAccessoryView addSubview:button];
        _doneButton = button;
    }
    return _doneButton;
}
- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.textColor = UIColor.lightGrayColor;
        label.numberOfLines = 2;
        [self addSubview:label];
        _placeholderLabel = label;
    }
    return _placeholderLabel;
}

#pragma mark - Action
- (void)doneAction {
    [self endEditing:NO];
    if (self.done) {
        self.done(self.text);
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.done) {
        self.done(textView.text);
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@""]) {
        if (textView.text.length > 0) {
            NSString *currentText = [textView.text substringToIndex:textView.text.length - 1];
            if (!currentText.length || [currentText isEqualToString:@""]) {
                self.placeholderLabel.hidden = NO;
            }
            if (self.change) {
                self.change(currentText);
            }
        }else {
            self.placeholderLabel.hidden = NO;
            if (self.change) {
                self.change(@"");
            }
        }
    }else {
        self.placeholderLabel.hidden = YES;
        if (self.change) {
            self.change([self.text stringByAppendingString:text]);
        }
    }
    return YES;
}

@end
