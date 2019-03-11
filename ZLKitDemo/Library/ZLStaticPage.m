//
//  ZLStaticPage.m
//  BulgeSeekUserPort
//
//  Created by zhaolei on 2018/8/17.
//  Copyright © 2018年 赵磊. All rights reserved.
//

#import "ZLStaticPage.h"
#import "ZLTemplateManger.h"

@interface ZLStaticPage ()

///点击
@property (nonatomic,strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation ZLStaticPage

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleTopInset = 20.0;
        self.actionTopInset = 10.0;
    }
    return self;
}

#pragma mark - Set
- (void)setTitle:(NSMutableAttributedString *)title {
    _title = title;
    [self updateValues];
}
- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self updateValues];
}
- (void)setImageTopInset:(CGFloat)imageTopInset {
    _imageTopInset = imageTopInset;
    [self updateValues];
}
- (void)setTitleTopInset:(CGFloat)titleTopInset {
    _titleTopInset = titleTopInset;
    [self updateValues];
}
- (void)setActionTopInset:(CGFloat)actionTopInset {
    _actionTopInset = actionTopInset;
    [self updateValues];
}
- (void)setPageAction:(void (^)(void))pageAction {
    _pageAction = pageAction;
    if (pageAction) {
        if (![self.gestureRecognizers containsObject:self.tapGestureRecognizer]) {
            [self addGestureRecognizer:self.tapGestureRecognizer];
        }
        return;
    }
    if ([self.gestureRecognizers containsObject:self.tapGestureRecognizer]) {
        [self removeGestureRecognizer:self.tapGestureRecognizer];
    }
}

#pragma mark - Lazy
- (UITapGestureRecognizer *)tapGestureRecognizer {
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageClick)];
    }
    return _tapGestureRecognizer;
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        UIImageView *button = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:button];
        _iconImageView = button;
    }
    return _iconImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = UIColor.lightGrayColor;
        label.font = [UIFont systemFontOfSize:14.0];
        label.numberOfLines = 0;
        [self addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}
- (UIButton *)button {
    if (!_button) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
        [button setTitleColor:templateManger.mainColor forState:UIControlStateNormal];
        [button addTarget:self action:@selector(bottomAction) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:button];
        _button = button;
    }
    return _button;
}

#pragma mark - Action
- (void)updateValues {
    UIImage *image = [UIImage imageNamed:self.iconName];
    if (self.iconName) {
        if ([self.iconName rangeOfString:@"ZLKit_"].location != NSNotFound) {
            NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
            NSString *path = [currentBundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@@%dx.png",self.iconName,(int)UIScreen.mainScreen.scale]];
            self.iconImageView.image = [UIImage imageWithContentsOfFile:path];
        }else {
            self.iconImageView.image = [UIImage imageNamed:self.iconName];
        }
    }
    if (self.title) {
        self.titleLabel.attributedText = self.title;
    }
    CGSize size = [self.title.string boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 100.0,MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
    self.iconImageView.frame = CGRectMake((UIScreen.mainScreen.bounds.size.width - image.size.width) / 2, self.imageTopInset, image.size.width, image.size.height);
    self.titleLabel.frame = CGRectMake(50.0, CGRectGetMaxY(self.iconImageView.frame) + self.titleTopInset, UIScreen.mainScreen.bounds.size.width - 100.0, size.height);
    if (self.buttonTitle) {
        self.button.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + self.actionTopInset, CGRectGetWidth(self.titleLabel.frame), 25.0);
        [self.button setTitle:self.buttonTitle forState:UIControlStateNormal];
    }
    if (self.iconName && self.title && !self.imageTopInset) {
        self.imageTopInset = (self.frame.size.height - image.size.height - self.titleTopInset - size.height - self.actionTopInset - 25.0 - 40.0) / 2;
    }
}
- (void)bottomAction {
    if (self.buttonAction) {
        self.buttonAction();
    }
}
- (void)pageClick {
    if (self.pageAction) {
        self.pageAction();
    }
}

///静态页的默认配置
- (void)defaultConfigMessage:(ZLHttpErrorState)errorState {
    if (errorState == ZLHttpErrorStateServerFailure) {//请求失败
        self.iconName = @"ZLKit_加载出错";
        self.title = [[NSMutableAttributedString alloc] initWithString:@"加载出错，请重新加载~"];
    }else if (errorState == ZLHttpErrorStateTimeout) {//超时
        self.iconName = @"ZLKit_网络超时";
        self.title = [[NSMutableAttributedString alloc] initWithString:@"哎呀，网络超时啦~"];
    }else {//断网
        self.iconName = @"ZLKit_网络出错";
        self.title = [[NSMutableAttributedString alloc] initWithString:@"哎呀，网络出错了~"];
    }
}

@end
