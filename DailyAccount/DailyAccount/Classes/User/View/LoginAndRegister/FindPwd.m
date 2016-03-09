//
//  FindPwd.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "FindPwd.h"

@implementation FindPwd

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
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.backButton.frame = CGRectMake(20, 20, 32, 32);
    [self.backButton setTitle:nil forState:UIControlStateNormal];
    self.backButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"userBack"]];
    [self addSubview:self.backButton];
    
    self.phoneNumTF = [[UITextField alloc] initWithFrame:CGRectMake(20, DAScreenHeight / 4, DAScreenWidth - 40, 30)];
    self.phoneNumTF.placeholder = @"请输入手机号";
    self.phoneNumTF.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.phoneNumTF];
    
    self.securityIDTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.phoneNumTF.frame), CGRectGetMaxY(self.phoneNumTF.frame) + 20, self.phoneNumTF.frame.size.width - 100, self.phoneNumTF.frame.size.height)];
    self.securityIDTF.placeholder = @"请输入手机验证码";
    self.securityIDTF.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.securityIDTF];
    
    self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendButton.frame = CGRectMake(CGRectGetMaxX(self.securityIDTF.frame) + 10, CGRectGetMinY(self.securityIDTF.frame), 90, self.securityIDTF.frame.size.height);
    [self.sendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.sendButton.tintColor = [UIColor whiteColor];
    self.sendButton.backgroundColor = DABlueColor;
    [self addSubview:self.sendButton];
    
    self.userPwdTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.securityIDTF.frame), CGRectGetMaxY(self.securityIDTF.frame) + 20, self.phoneNumTF.frame.size.width, self.phoneNumTF.frame.size.height)];
    self.userPwdTF.placeholder = @"请输入密码";
    self.userPwdTF.secureTextEntry = YES;
    self.userPwdTF.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.userPwdTF];
    
    self.userPwdTF2 = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.userPwdTF.frame), CGRectGetMaxY(self.userPwdTF.frame) + 20, self.userPwdTF.frame.size.width, self.userPwdTF.frame.size.height)];
    self.userPwdTF2.placeholder = @"请再次输入密码";
    self.userPwdTF2.secureTextEntry = YES;
    self.userPwdTF2.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.userPwdTF2];
    
    self.resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.resetButton
    .frame = CGRectMake(50, CGRectGetMaxY(self.userPwdTF2.frame) + 50, DAScreenWidth - 100, self.userPwdTF2.frame.size.height);
    self.resetButton.layer.cornerRadius = 15;
    [self.resetButton setTitle:@"重置" forState:UIControlStateNormal];
    self.resetButton.tintColor = DABlueColor;
    self.resetButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.resetButton];
}

@end
