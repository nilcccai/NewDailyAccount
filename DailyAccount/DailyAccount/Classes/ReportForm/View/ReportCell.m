//
//  ReportCell.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportCell.h"

@implementation ReportCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return self;
}


- (void)allViews {
    
    //收支明细图标
    self.picture = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_milestone_heart"]];
    self.picture.frame = CGRectMake(0, 0, 44, 44);
    self.picture.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.picture];
    
    //收支明细名称
    self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(44, 19, 60, 25)];
    self.labelName.text = @"餐饮";
    [self.contentView addSubview:self.labelName];
    
    //收支分类占比
    self.lablePercent = [[UILabel alloc] initWithFrame:CGRectMake(DAScreenWidth / 2, 19, 60, 25)];
    self.lablePercent.text = @"75%";
    self.lablePercent.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.lablePercent];
    
    //收支明细金额
    self.labelMoney = [[UILabel alloc] initWithFrame:CGRectMake(DAScreenWidth - 100, 19, 90, 25)];
    self.labelMoney.textAlignment = NSTextAlignmentRight;
    self.labelMoney.text = @"98";
    [self.contentView addSubview:self.labelMoney];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
