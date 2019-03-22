//
//  HorizontalViewController.m
//  HorizontalDemo
//
//  Created by gejiangs on 2019/3/22.
//  Copyright © 2019 gejiangs. All rights reserved.
//

#import "HorizontalViewController.h"

@interface HorizontalViewController ()

@end

@implementation HorizontalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(50, 50, 100, 50);
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

-(void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}
@end
