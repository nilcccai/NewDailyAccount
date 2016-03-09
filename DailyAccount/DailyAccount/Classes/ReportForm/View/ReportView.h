//
//  ReportView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportView : UIView

@property (nonatomic,strong) UITableView *tableView;
//显示日期视图
@property (nonatomic,strong) UIView *dateView;

//日期按钮
@property (nonatomic,strong) UIButton *dateButton;

@property(nonatomic,strong)UIButton *weakButton;


@end
