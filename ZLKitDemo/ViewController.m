//
//  ViewController.m
//  ZLKitDemo
//
//  Created by 赵磊 on 2019/3/5.
//  Copyright © 2019 赵磊. All rights reserved.
//

#import "ViewController.h"
#import "ZLKitHeader.h"
#import "ZLStaticPage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZL_Navigation_Height(navigationHeight, isBangDevice);
    ZLStaticPage *staticPage = [[ZLStaticPage alloc] initWithFrame:CGRectMake(0, navigationHeight, ZL_Screen_Size.width, ZL_Screen_Size.height - navigationHeight)];
    [staticPage defaultConfigMessage:1];
    [self.view addSubview:staticPage];
}


@end
