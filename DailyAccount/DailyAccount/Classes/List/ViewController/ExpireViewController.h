//
//  ExpireViewController.h
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExpireViewControllerDelegate <NSObject>

-(void)sendMessageToExpireWith:(NSString *)str;


@end
@interface ExpireViewController : UIViewController

@property(nonatomic,weak)id<ExpireViewControllerDelegate>delegate;
@end
