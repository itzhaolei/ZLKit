//
//  ZLViewController.m
//  ZLKit
//
//  Created by itzhaolei on 03/11/2019.
//  Copyright (c) 2019 itzhaolei. All rights reserved.
//

#import "ZLViewController.h"
#import <ZLKit/ZLStaticPage.h>

@interface ZLViewController ()

@end

@implementation ZLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ZLStaticPage *view = [[ZLStaticPage alloc] initWithFrame:self.view.bounds];
    [view showDefaultStaticPageMessage:1];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
