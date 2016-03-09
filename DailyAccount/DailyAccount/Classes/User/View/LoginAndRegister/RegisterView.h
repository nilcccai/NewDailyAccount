//
//  RegisterView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView

// 手机号
@property (nonatomic, strong) UITextField *phoneNumTF;
// 验证码
@property (nonatomic, strong) UITextField *securityIDTF;
// 用户名
@property (nonatomic, strong) UITextField *userNameTF;
// 密码
@property (nonatomic, strong) UITextField *userPwdTF;
// 确认密码
@property (nonatomic, strong) UITextField *userPwdTF2;

// 发送验证码
@property (nonatomic, strong) UIButton *sendButton;
// 注册
@property (nonatomic, strong) UIButton *registerButton;
// 返回
@property (nonatomic, strong) UIButton *backButton;

@end
