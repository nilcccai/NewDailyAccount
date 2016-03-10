//
//  accountCell.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/9.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "accountCell.h"

@implementation accountCell
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
//    self.picture = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    self.picture = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, DAScreenWidth /3, self.contentView.frame.size.height -74)];
    self.picture.image = [UIImage imageNamed:@"book"];
    [self.contentView addSubview:self.picture];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(self.picture.frame.size.width / 4 , self.picture.frame.size.height / 2, self.picture.frame.size.width / 4 * 3, 25)];
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
