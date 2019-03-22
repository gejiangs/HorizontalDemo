//
//  DetailViewController.m
//  HorizontalDemo
//
//  Created by gejiangs on 2019/3/22.
//  Copyright © 2019 gejiangs. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail";
    
    [self initUI];
}

-(void)initUI
{
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"present" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = right;
}

-(void)rightAction
{
    UIViewController *vc = [[NSClassFromString(@"HorizontalViewController") alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
