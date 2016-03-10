//
//  ListTableViewCell.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/7.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ListTableViewCell.h"
#import "ListModel.h"
#import "SRModel.h"
@implementation ListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(ListModel *)model
{
    _model = model;
    self.RNameLabel.text = model.name;
    self.RMoneyLabel.text = model.money;
    self.aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.image]];
    
}

-(void)setSrModel:(SRModel *)srModel
{
    _srModel = srModel;
    self.LNameLabel.text = srModel.name;
    self.LMoneyLabel.text = srModel.money;
        self.aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",srModel.image]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
