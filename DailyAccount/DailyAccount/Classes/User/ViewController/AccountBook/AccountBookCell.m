//
//  AccountBookCell.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AccountBookCell.h"

@implementation AccountBookCell

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
    self.backgroundColor = [UIColor whiteColor];
    self.picture = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    self.picture.image = [UIImage imageNamed:@"book"];
    [self.contentView addSubview:self.picture];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(self.picture.bounds.size.width / 4 , self.picture.bounds.size.height / 2, self.picture.bounds.size.width / 4 * 3, 25)];
    self.name.numberOfLines = 0;
    [self.picture addSubview:self.name];
    
    self.contentView.layer.cornerRadius = 10;
    
}
// 当bounds发生改变的时候，会自动调用这个方法
- (void)layoutSubviews
{
    // 在这里面对imageView的大小进行调整
    // 1.拿到imageView的大小
    CGRect frame1 = self.picture.frame;
    // 2.拿到当前Item的大小
    CGRect frame2 = self.frame;
    // 3.修改数据并设置回去
    frame1.size = frame2.size;
    self.picture.frame = frame1;
}
@end
