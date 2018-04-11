//
//  ViewController.m
//  ChildViewControllerTest
//
//  Created by wanglei on 2018/4/11.
//  Copyright © 2018年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, strong) LeftViewController *leftVC;
@property (nonatomic, strong) SecondViewController *secondVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)respondsToAddFirst:(id)sender
{
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    
//    [leftVC willMoveToParentViewController:self];可不调用
    [self addChildViewController:leftVC];
    [self.view addSubview:leftVC.view];
    [leftVC didMoveToParentViewController:self];
}

- (IBAction)respondsToAddSecond:(id)sender
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self addChildViewController:secondVC];
    [self.view addSubview:secondVC.view];
    [secondVC didMoveToParentViewController:self];
}

- (IBAction)respondsToStartTransform:(id)sender
{
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    leftVC.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
    [self addChildViewController:leftVC];
    self.leftVC = leftVC;
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.view.frame = CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height - 150);
    [self addChildViewController:secondVC];
    self.secondVC = secondVC;
    
    
    [self.view addSubview:leftVC.view];
    self.currentVC = leftVC;

}
- (IBAction)respondsToTransform:(id)sender
{
    UIViewController *newVC = nil;
    if ([self.currentVC isKindOfClass:[LeftViewController class]]) {
        newVC = self.secondVC;
    } else {
        newVC = self.leftVC;
    }
    [self.currentVC willMoveToParentViewController:nil];
    
    [self transitionFromViewController:self.currentVC toViewController:newVC duration:0.01 options:(UIViewAnimationOptionTransitionCurlUp) animations:^{
        
    } completion:^(BOOL finished) {
        if (finished) {
            self.currentVC = newVC;
        }
    }];
    [newVC didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
