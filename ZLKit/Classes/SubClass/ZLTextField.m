//
//  ZLTextField.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLTextField.h"
#import "ZLTemplateManger.h"

@interface ZLTextField ()<UITextFieldDelegate>

{
    ///工具条
    UIView *_inputAccessoryView;
    ///确定按钮
    UIButton *_doneButton;
}

///上一次输入的内容
@property (nonatomic,strong) NSString *lastText;

@end

@implementation ZLTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.delegate = self;
        self.font = [UIFont systemFontOfSize:16.0];
        self.returnKeyType = UIReturnKeyDone;
    }
    return self;
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

#pragma mark - Action
- (void)doneAction {
    [self endEditing:NO];
    if (self.done) {
        self.done(self.text);
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:NO];
    if (self.done) {
        self.done(textField.text);
    }
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.banPunctuation) {
        if ([string rangeOfString:@"0123456789QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm"].location == NSNotFound) {
            return NO;
        }
    }
    if (![string isEqualToString:@""]) {
        if (textField.text.length > self.maxLenght - 1) {
            return NO;
        }
    }
    return YES;
}

@end
