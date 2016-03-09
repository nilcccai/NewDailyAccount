//
//  LoginView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

// 用户名
@property (nonatomic, strong) UITextField *userNameTF;
// 密码
@property (nonatomic, strong) UITextField *userPwdTF;
// 登录
@property (nonatomic, strong) UIButton *loginButton;
// 注册
@property (nonatomic, strong) UIButton *registerButton;
// 忘记密码
@property (nonatomic, strong) UIButton *findPwdButton;
// 返回
@property (nonatomic, strong) UIButton *backButton;

@end
