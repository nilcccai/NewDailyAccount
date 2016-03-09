//
//  LoginViewController.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserNameDelegate <NSObject>

- (void)changeUserName:(NSString *)name;

@end

@interface LoginViewController : UIViewController

@property (nonatomic, assign) id<UserNameDelegate>delegate;

@end
