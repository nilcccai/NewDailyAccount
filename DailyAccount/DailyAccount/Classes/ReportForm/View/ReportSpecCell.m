//
//  ReportSpecCell.m
//  DailyAccount
//
//  Created by 王峰 on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportSpecCell.h"

@implementation ReportSpecCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self allViews];
    }
    return self;
}

- (void)allViews{
    
    self.specImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    self.specImageView.frame = CGRectMake(5, 0, 30, 30);
    [self addSubview:self.specImageView];
    
    self.specLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 50, 30)];
    self.specLabel.text = @"餐饮";
    self.specLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.specLabel];
    
    self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 50, 30)];
    self.moneyLabel.text = @"11111";
    [self addSubview:self.moneyLabel];
    
    self.accoLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 50, 30)];
    self.accoLabel.text = @"账本";
    [self addSubview:self.accoLabel];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 120, 50, 30)];
    self.timeLabel.text = @"时间";
    [self addSubview:self.timeLabel];
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
