//
//  CalendarViewController.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

//1.创建一个block属性
typedef void(^valueBlock)(NSString *value);
//typedef void(^loopBlock)();


@interface PWSCalendarViewController : UIViewController
//2.
@property(nonatomic,copy)valueBlock  block;
//@property(nonatomic,copy)loopBlock LB;


@end
