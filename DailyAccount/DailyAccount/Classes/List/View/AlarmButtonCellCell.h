//
//  AlarmButtonCellCell.h
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AlarmModel;
@interface AlarmButtonCellCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *fateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *markImageView;

@property (weak, nonatomic) IBOutlet UILabel *expireLabel;

@property(nonatomic,strong)AlarmModel *alarmModel;
@end
