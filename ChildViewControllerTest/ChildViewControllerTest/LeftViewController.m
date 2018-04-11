//
//  LeftViewController.m
//  ChildViewControllerTest
//
//  Created by wanglei on 2018/4/11.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = self.view.bounds;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(respondsToButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)respondsToButton
{
    NSLog(@"====");
    [self willMoveToParentViewController:nil];
    [self removeFromParentViewController];
    [self didMoveToParentViewController:nil];//可不调用
    
    [self.view removeFromSuperview];
}


@end
