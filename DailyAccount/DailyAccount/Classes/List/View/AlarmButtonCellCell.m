//
//  AlarmButtonCellCell.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AlarmButtonCellCell.h"
#import "AlarmModel.h"

@implementation AlarmButtonCellCell


- (void)awakeFromNib {
    
      self.expireLabel.clipsToBounds = YES;
      self.expireLabel.layer.cornerRadius = 10;
}

-(void)setAlarmModel:(AlarmModel *)alarmModel
{
     _alarmModel = alarmModel;
    self.nameLabel.text = alarmModel.name;
    self.dateLabel.text = alarmModel.time;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
