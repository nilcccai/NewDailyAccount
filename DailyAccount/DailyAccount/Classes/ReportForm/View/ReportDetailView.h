//
//  ReportDetailView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportDetailView : UIView

@property (nonatomic,strong) UITableView *tableView;
//显示日期视图
@property (nonatomic,strong) UIView *dateViewD;

//日期按钮
@property (nonatomic,strong) UIButton *dateButtonD;

//某一类标签
@property (nonatomic,strong) UIView *categoryView;
//分类名
@property (nonatomic,strong)UILabel *labelCategoryName;
//分类金额
@property (nonatomic,strong)UILabel *labelCategoryMoney;



@end
