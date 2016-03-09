//
//  AddController.h
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddControllerDelegate <NSObject>

-(void)sendMessageToAlarmWith:(NSMutableArray *)mutArray;

@end

@interface AddController : UITableViewController

@property(nonatomic,weak)id<AddControllerDelegate>delegate;
@end
