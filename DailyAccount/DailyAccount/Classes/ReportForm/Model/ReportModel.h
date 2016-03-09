//
//  ReportModel.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReportModel : NSObject

///图标
@property (nonatomic,strong)NSString *s_image;
///分类
@property (nonatomic,strong)NSString *category;
///百分比
@property (nonatomic,strong)NSString *percentage;
//金额
@property (nonatomic,strong)NSString *money;

@end
