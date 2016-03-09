//
//  MoneyViewController.h
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoneyViewControllerDelegate <NSObject>

-(void)sendMessageToMoneytWith:(NSString *)str;

@end
@interface MoneyViewController : UIViewController

@property(nonatomic,weak)id<MoneyViewControllerDelegate>delegate;
@end
