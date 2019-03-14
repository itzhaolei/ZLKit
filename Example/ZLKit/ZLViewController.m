//
//  ZLViewController.m
//  ZLKit
//
//  Created by itzhaolei on 03/11/2019.
//  Copyright (c) 2019 itzhaolei. All rights reserved.
//

#import "ZLViewController.h"
#import "ZLStaticPage.h"

@interface ZLViewController ()

@end

@implementation ZLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = templateManger.randomColor;
    ZLStaticPage *staticPage = [[ZLStaticPage alloc] initWithFrame:self.view.bounds];
    [staticPage showDefaultStaticPageMessage:nil];
    [self.view addSubview:staticPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用");
    [ZLWarnView showErrorMessageOnView:nil Servicer:NO Message:@"错误信息"];
}

@end
