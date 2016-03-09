//
//  AccountBookVIew.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AccountBookVIew.h"

@implementation AccountBookVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    /*
    layout.itemSize = CGSizeMake((DAScreenWidth - 30) / 2, (DAScreenWidth - 30) / 2 * 1.5);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumInteritemSpacing = 10;     // 最小行间距
    layout.minimumLineSpacing = 0;          // 最小列间距
     */
    [self addSubview:self.collectionView];
}

@end
