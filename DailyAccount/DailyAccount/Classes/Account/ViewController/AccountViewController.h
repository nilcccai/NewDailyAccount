//
//  AccountViewController.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AccountViewControllerDelegate <NSObject>

-(void)sendMessageToAlarmWith:(NSMutableDictionary *)mutArray;

@end

@interface AccountViewController : UIViewController

@property(nonatomic,weak)id<AccountViewControllerDelegate>delegate;
@end
