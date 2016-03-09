//
//  AddBookViewController.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BookNameDelegate <NSObject>

- (void)AddBookName:(NSString *)name;

@end

@interface AddBookViewController : UIViewController

@property (nonatomic, strong) UITextField *nameTF;

@property (nonatomic, assign) id<BookNameDelegate>delegate;

@end
