//
//  FindPwd.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindPwd : UIView

// 手机号
@property (nonatomic, strong) UITextField *phoneNumTF;
// 验证码
@property (nonatomic, strong) UITextField *securityIDTF;
// 密码
@property (nonatomic, strong) UITextField *userPwdTF;
// 确认密码
@property (nonatomic, strong) UITextField *userPwdTF2;
// 发送验证码
@property (nonatomic, strong) UIButton *sendButton;
// 重置
@property (nonatomic, strong) UIButton *resetButton;
// 返回
@property (nonatomic, strong) UIButton *backButton;
@end
