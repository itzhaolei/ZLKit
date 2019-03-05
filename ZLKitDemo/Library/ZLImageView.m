//
//  ZLImageView.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ZLImageView.h"
#import "ZLTemplateManger.h"

@interface ZLImageView ()

{
    UIImageView *_coverImageView;
    ZLLabel *_titleLabel;
    ZLLabel *_subTitleLabel;
    ZLLabel *_otherTitleLabel;
    ZLImageView *_iconImageView;
    ZLImageView *_iconOhterImageView;
}

///点击
@property (nonatomic,strong) UITapGestureRecognizer *tapGr;

@end

@implementation ZLImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = templateManger.placeholderColor;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.coverImageName) {
        self.coverImageView.bounds = self.bounds;
        UIImage *image = [UIImage imageNamed:self.coverImageName];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake((image.size.height - 1.0) / 2, (image.size.width - 1.0) / 2, (image.size.height - 1.0) / 2 + 1, (image.size.width - 1.0) / 2 + 1) resizingMode:(UIImageResizingModeStretch)];
        self.coverImageView.image = image;
    }
}

#pragma mark - Set
- (void)setAspectFill:(BOOL)aspectFill {
    _aspectFill = aspectFill;
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
}
- (void)setAction:(void (^)(void))action {
    _action = action;
    if (action) {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:self.tapGr];
    }else {
        self.userInteractionEnabled = NO;
        [self removeGestureRecognizer:self.tapGr];
    }
}
- (void)setCoverImageName:(NSString *)coverImageName {
    _coverImageName = coverImageName;
    UIImage *image = [UIImage imageNamed:coverImageName];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake((image.size.height - 1.0) / 2, (image.size.width - 1.0) / 2, (image.size.height - 1.0) / 2 + 1, (image.size.width - 1.0) / 2 + 1) resizingMode:(UIImageResizingModeStretch)];
    self.coverImageView.image = image;
}

#pragma mark - Lazy
- (UITapGestureRecognizer *)tapGr {
    if (!_tapGr) {
        _tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerAction)];
    }
    return _tapGr;
}
- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
        _coverImageView = imageView;
    }
    return _coverImageView;
}
- (ZLLabel *)titleLabel {
    if (!_titleLabel) {
        ZLLabel *label = [[ZLLabel alloc] initWithFrame:CGRectZero];
        [self addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}
- (ZLLabel *)subTitleLabel {
    if (!_subTitleLabel) {
        ZLLabel *label = [[ZLLabel alloc] initWithFrame:CGRectZero];
        [self addSubview:label];
        _subTitleLabel = label;
    }
    return _subTitleLabel;
}
- (ZLLabel *)otherTitleLabel {
    if (!_otherTitleLabel) {
        ZLLabel *label = [[ZLLabel alloc] initWithFrame:CGRectZero];
        [self addSubview:label];
        _otherTitleLabel = label;
    }
    return _otherTitleLabel;
}
- (ZLImageView *)iconImageView {
    if (!_iconImageView) {
        ZLImageView *imageView = [[ZLImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:imageView];
        _iconImageView = imageView;
    }
    return _iconImageView;
}
- (ZLImageView *)iconOhterImageView {
    if (!_iconOhterImageView) {
        ZLImageView *imageView = [[ZLImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:imageView];
        _iconOhterImageView = imageView;
    }
    return _iconOhterImageView;
}

#pragma mark - Action
- (void)tapGestureRecognizerAction {
    if (self.action) {
        self.action();
    }
}

@end
