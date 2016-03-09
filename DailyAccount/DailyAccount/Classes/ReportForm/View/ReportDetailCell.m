//
//  ReportDetailCell.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportDetailCell.h"
#import "ReportDetailView.h"

@implementation ReportDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return self;
}

- (void)allViews { 
    //收支明细图标
    self.detailPicture = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_milestone_heart"]];
    self.detailPicture.frame = CGRectMake(0, 0, 25, 25);
    self.detailPicture.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.detailPicture];
    
    //收支明细名称
    self.labelDetailName = [[UILabel alloc] initWithFrame:CGRectMake(44, 0, 60, 25)];
    self.labelDetailName.text = @"餐饮";
    [self.contentView addSubview:self.labelDetailName];
    
    //收支明细金额
    self.labelDetailMoney = [[UILabel alloc] initWithFrame:CGRectMake(DAScreenWidth - 100, 0, 90, 25)];
    self.labelDetailMoney.textAlignment = NSTextAlignmentRight;
    self.labelDetailMoney.text = @"28";
    [self.contentView addSubview:self.labelDetailMoney];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
