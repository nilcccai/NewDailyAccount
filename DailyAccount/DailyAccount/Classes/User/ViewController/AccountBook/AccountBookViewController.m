//
//  AccountBookViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AccountBookViewController.h"
#import "AccountBookVIew.h"
#import "AccountBookCell.h"
#import "AddBookViewController.h"
#import <AVOSCloud.h>

@interface AccountBookViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, BookNameDelegate>

@property (nonatomic, strong) AccountBookVIew *accountBookView;

@end

@implementation AccountBookViewController

- (NSMutableArray *)bookName
{
    if (_bookName == nil)
    {
        _bookName = [NSMutableArray arrayWithObjects:@"默认账本", @"旅游账本", @"生意账本", nil];
    }
    return _bookName;
}


- (void)loadView
{
    self.accountBookView = [AccountBookVIew new];
    self.view = self.accountBookView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"多账本";
    
    self.accountBookView.collectionView.delegate = self;
    self.accountBookView.collectionView.dataSource = self;
    self.accountBookView.collectionView.backgroundColor = [UIColor whiteColor];
    [self.accountBookView.collectionView registerClass:[AccountBookCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    UIBarButtonItem *addBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStyleDone target:self action:@selector(addBarDidClicked:)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = addBar;
    
}

#pragma mark add添加
- (void)addBarDidClicked:(UIBarButtonItem *)sender
{
    AddBookViewController *addBookVC = [AddBookViewController new];
    [self.navigationController pushViewController:addBookVC animated:YES];
    addBookVC.delegate = self;
}

- (void)AddBookName:(NSString *)name withObjectID:(NSString *)objectID
{    
    [self.bookName addObject:name];
    NSLog(@"%@", self.bookName);
    [self.accountBookView.collectionView reloadData];
}

#pragma mark 个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.bookName.count;
}

#pragma mark cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AccountBookCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.name.tintColor = [UIColor whiteColor];
    cell.name.text = self.bookName[indexPath.row];
    cell.layer.masksToBounds = YES;
//    cell.contentView.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 10;
    cell.name.textAlignment = NSTextAlignmentCenter;
//    cell.contentView.layer.cornerRadius = 10;
    return cell;
    
}

#pragma mark 行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

#pragma mark cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((DAScreenWidth - 60) / 2, (DAScreenWidth - 60) / 2 * 1.5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end