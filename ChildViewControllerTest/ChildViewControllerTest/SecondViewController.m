//
//  SecondViewController.m
//  ChildViewControllerTest
//
//  Created by wanglei on 2018/4/11.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = self.view.bounds;
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(respondsToButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)respondsToButton
{
    [self willMoveToParentViewController:nil];
    [self removeFromParentViewController];
    
    [self.view removeFromSuperview];
}

@end
