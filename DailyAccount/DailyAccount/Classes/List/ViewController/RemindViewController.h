//
//  RemindViewController.h
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理传值
@protocol RemindViewControllerDelegate <NSObject>

-(void)sendMessageToFirstWith:(NSString *)str;


@end

@interface RemindViewController : UIViewController

@property(nonatomic,weak)id<RemindViewControllerDelegate>delegate;
@end
