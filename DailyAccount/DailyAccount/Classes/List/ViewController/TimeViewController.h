//
//  TimeViewController.h
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TimeViewControllerDelegate <NSObject>

-(void)sendMessageToTimeWith:(NSString *)str;

@end

@interface TimeViewController : UIViewController

@property(nonatomic,weak)id<TimeViewControllerDelegate>delegate;
@end
