//
//  ReportSpecificView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportSpecificView : UIView

//新建table
@property(nonatomic,strong)UITableView *table;
//存储每一个分组的信息
@property(nonatomic,strong)NSMutableArray *date;
//新建底部button
@property (nonatomic, strong) UIButton *bottomButton;

@end
