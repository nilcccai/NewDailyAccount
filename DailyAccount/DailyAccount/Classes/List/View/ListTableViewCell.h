//
//  ListTableViewCell.h
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/7.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListModel;
@class SRModel;
@interface ListTableViewCell : UITableViewCell

@property(nonatomic,strong)ListModel *model;

@property(nonatomic,strong)SRModel *srModel;

@property (weak, nonatomic) IBOutlet UILabel *RNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *RMoneyLabel;

@property (weak, nonatomic) IBOutlet UILabel *LNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *LMoneyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *aImageView;


@end
