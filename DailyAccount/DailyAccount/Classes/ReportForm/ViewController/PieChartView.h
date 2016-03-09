//
//  PieChartView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotatedView.h"
@class PieChartView;
@protocol PieChartDelegate <NSObject>
@optional
- (void)selectedFinish:(PieChartView *)pieChartView index:(NSInteger)index percent:(float)per;
- (void)onCenterClick:(PieChartView *)PieChartView;
@end

@interface PieChartView : UIView <RotatedViewDelegate>
@property(nonatomic, assign) id<PieChartDelegate> delegate;
- (id)initWithFrame:(CGRect)frame withValue:(NSMutableArray *)valueArr withColor:(NSMutableArray *)colorArr;
- (void)reloadChart;
- (void)setAmountText:(NSString *)text;
- (void)setTitleText:(NSString *)text;
@end
