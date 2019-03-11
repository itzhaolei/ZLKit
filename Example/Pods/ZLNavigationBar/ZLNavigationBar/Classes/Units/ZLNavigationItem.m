//
//  ZLNavigationLeftItem.m
//  ZLNavigationBar
//
//  Created by zhaolei on 2018/12/28.
//

#import "ZLNavigationItem.h"

@implementation ZLNavigationItem

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - Set
- (void)setImageName:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
- (void)setImageFileName:(NSString *)imageFileName {
    [self setImage:[UIImage imageWithContentsOfFile:[NSBundle.mainBundle.bundlePath stringByAppendingPathComponent:imageFileName]] forState:UIControlStateNormal];
}

#pragma mark - Action
- (void)action {
    if (self.click) {
        self.click();
    }
}
- (void)setupDefaultGobackImage {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [currentBundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"ZLNavigationBar.bundle/ZLNavigationBar_GoBack@%dx.png",(int)UIScreen.mainScreen.scale]];
    [self setImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
}

@end
