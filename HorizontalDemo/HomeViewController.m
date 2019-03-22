//
//  HomeViewController.m
//  HorizontalDemo
//
//  Created by gejiangs on 2019/3/22.
//  Copyright © 2019 gejiangs. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)   UICollectionView *collectionView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Horizontal";
    
    [self initUI];
}

-(void)initUI
{
    self.edgesForExtendedLayout= UIRectEdgeNone;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.collectionView];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"present" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;
}

-(void)leftAction
{
    UIViewController *vc = [[NSClassFromString(@"DetailViewController") alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)rightAction
{
    UIViewController *vc = [[NSClassFromString(@"HorizontalViewController") alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark UICollectionView

-(UICollectionView *)collectionView
{
    if (_collectionView) {
        return _collectionView;
    }
    //初始化
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    UICollectionView *view = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    view.delegate = self;
    view.dataSource = self;
    view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    view.backgroundColor = [UIColor clearColor];
    view.scrollEnabled = YES;
    view.pagingEnabled = YES;
    [view registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.collectionView = view;
    
    return _collectionView;
}

#pragma mark - UICollectionView Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ident forIndexPath:indexPath];
    
    UILabel *textLabel = [cell.contentView viewWithTag:100];
    if (textLabel == nil) {
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
        textLabel.tag = 100;
        textLabel.textColor = [UIColor blackColor];
        [cell.contentView addSubview:textLabel];
    }
    
    textLabel.text = [NSString stringWithFormat:@"Cell %d", (int)indexPath.row];
    
    if (indexPath.row == 0) {
        cell.contentView.backgroundColor = [UIColor grayColor];
    }else if (indexPath.row == 1){
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
    }else if (indexPath.row == 2){
        cell.contentView.backgroundColor = [UIColor lightTextColor];
    }
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.collectionView.bounds.size;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSLog(@"current page :%d", (int)page);
}

#pragma mark - System

@end
