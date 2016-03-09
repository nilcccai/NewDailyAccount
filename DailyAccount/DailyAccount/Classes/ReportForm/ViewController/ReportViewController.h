//
//  ReportViewController.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieChartView.h"
#import "ReportView.h"
#import "ReportCell.h"

@interface ReportViewController : UIViewController<PieChartDelegate>

@property(nonatomic,strong)ReportView *reportView;
//每一个cell的数据信息
@property(nonatomic,strong)NSMutableArray *tableData;

//section 标题
@property(nonatomic,strong)NSDictionary *setionDic;
//table 数组
@property(nonatomic,strong)NSMutableArray *cellArray;
@end



