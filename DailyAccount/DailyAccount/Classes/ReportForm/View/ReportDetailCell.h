//
//  ReportDetailCell.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportDetailCell : UITableViewCell

//收支某一个具体分类图标
@property (nonatomic,strong) UIImageView *detailPicture;
//收支具体分类名称
@property (nonatomic,strong) UILabel *labelDetailName;
//收支具体分类某一笔金额
@property (nonatomic,strong) UILabel *labelDetailMoney;

@end
