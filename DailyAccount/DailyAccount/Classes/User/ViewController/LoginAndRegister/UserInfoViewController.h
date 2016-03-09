//
//  UserInfoViewController.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserLogOut <NSObject>

- (void)changeUserLogOutName:(NSString *)name;

@end

@interface UserInfoViewController : UIViewController

@property (nonatomic, assign) id<UserLogOut>delegate;

@end
