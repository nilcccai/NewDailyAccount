//
//  ReportCell.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportCell : UITableViewCell

//收支明细图标
@property (nonatomic,strong) UIImageView *picture;
//收支明细名称
@property (nonatomic,strong) UILabel *labelName;
//收支分类占比
@property (nonatomic,strong) UILabel *lablePercent;
//收支明细金额
@property (nonatomic,strong) UILabel *labelMoney;

@end
