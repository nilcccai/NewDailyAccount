//
//  LoginView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.backgroundColor = DABlueColor;
    
    self.userNameTF = [[UITextField alloc] initWithFrame:CGRectMake(20, (DAScreenHeight - 100) / 4, DAScreenWidth - 40, 30)];
    self.userNameTF.placeholder = @"请输入手机号/用户名";
    self.userNameTF.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.userNameTF];
    
    self.userPwdTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.userNameTF.frame), CGRectGetMaxY(self.userNameTF.frame) + 20, self.userNameTF.frame.size.width, self.userNameTF.frame.size.height)];
    self.userPwdTF.borderStyle = UITextBorderStyleRoundedRect;
    self.userPwdTF.placeholder = @"请输入密码";
    self.userPwdTF.secureTextEntry = YES;
    [self addSubview:self.userPwdTF];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loginButton.frame = CGRectMake(40, CGRectGetMaxY(self.userPwdTF.frame) + 60, (DAScreenWidth - 120) / 2, 30);
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTintColor:DABlueColor];
    self.loginButton.backgroundColor = [UIColor whiteColor];
    self.loginButton.layer.cornerRadius = 15;
    [self addSubview:self.loginButton];
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registerButton.frame = CGRectMake(CGRectGetMaxX(self.loginButton.frame) + 40, CGRectGetMinY(self.loginButton.frame), self.loginButton.bounds.size.width, self.loginButton.bounds.size.height);
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton setTintColor:DABlueColor];
    self.registerButton.backgroundColor = [UIColor whiteColor];
    self.registerButton.layer.cornerRadius = 15;
    [self addSubview:self.registerButton];
    
    self.findPwdButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.findPwdButton.frame = CGRectMake(DAScreenWidth - 120, CGRectGetMaxY(self.userPwdTF.frame) + 15, 100, 30);
    [self.findPwdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.findPwdButton.tintColor = [UIColor whiteColor];
    [self addSubview:self.findPwdButton];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.backButton.frame = CGRectMake(20, 20, 32, 32);
    [self.backButton setTitle:nil forState:UIControlStateNormal];
    self.backButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"userDown"]];
    [self addSubview:self.backButton];
    
}

@end
