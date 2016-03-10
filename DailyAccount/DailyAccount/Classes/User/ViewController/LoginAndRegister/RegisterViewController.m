//
//  RegisterViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import <AVOSCloud.h>

@interface RegisterViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) RegisterView *registerView;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger time;

@end

@implementation RegisterViewController

- (void)loadView
{
    self.registerView = [RegisterView new];
    self.view = self.registerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.registerView.phoneNumTF.delegate = self;
    self.registerView.securityIDTF.delegate = self;
    self.registerView.userNameTF.delegate = self;
    self.registerView.userPwdTF.delegate = self;
    self.registerView.userPwdTF2.delegate = self;
    
    [self.registerView.backButton addTarget:self action:@selector(backButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerView.sendButton addTarget:self action:@selector(sendButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerView.registerButton addTarget:self action:@selector(registerButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark 返回按钮点击事件
- (void)backButtonDidClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 发送验证码
- (void)sendButtonDidClicked:(UIButton *)sender
{
//#warning 记得打开啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊！！！！！！！！！！！！！！！！！！！！
    /*
    [AVOSCloud requestSmsCodeWithPhoneNumber:self.registerView.phoneNumTF.text appName:@"每天记" operation:@"注册账户" timeToLive:5 callback:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
            NSLog(@"获取成功");
            self.time = 30;
            [self.registerView.sendButton removeTarget:self action:@selector(timeAction) forControlEvents:UIControlEventTouchUpInside];
            self.registerView.sendButton.userInteractionEnabled = NO;
            [self timeAction];
        }
        else
        {
            NSLog(@"错误");
        }
    }];
     */
}

#pragma mark 倒计时
- (void)timeAction
{
    self.time--;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:NO];
    NSString *str = [NSString stringWithFormat:@"剩余%ld秒", (long)self.time];
    [self.registerView.sendButton setTitle:str forState:UIControlStateNormal];
    if (self.time == 0)
    {
        [self.timer invalidate];
        self.timer = nil;
        [self.registerView.sendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self.registerView.sendButton addTarget:self action:@selector(sendButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark 注册按钮
- (void)registerButtonDidClicked:(UIButton *)sender
{
    // 验证验证码
#warning 上线打开噢！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
//    [AVOSCloud verifySmsCode:self.registerView.securityIDTF.text mobilePhoneNumber:self.registerView.phoneNumTF.text callback:^(BOOL succeeded, NSError *error) {
//        if (succeeded)
//        {
            // 注册
            AVUser *user = [AVUser user];
            user.username = self.registerView.userNameTF.text;
            user.password = self.registerView.userPwdTF.text;
            user.mobilePhoneNumber = self.registerView.phoneNumTF.text;
            if ([self.registerView.userPwdTF.text isEqualToString:self.registerView.userPwdTF2.text])
            {
                [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded)
                    {
                        NSLog(@"注册成功");
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else
                    {
                        NSLog(@"注册失败");
                    }
                }];
            }
            else
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册失败，两次密码不一致" preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alert animated:YES completion:nil];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancelAction];
            }
//        }
//        else
//        {
//            NSLog(@"验证失败");
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误" preferredStyle:UIAlertControllerStyleAlert];
//            [self presentViewController:alert animated:YES completion:nil];
//            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
//            [alert addAction:cancelAction];
//        }
//    }];
}

#pragma mark 键盘回收
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
