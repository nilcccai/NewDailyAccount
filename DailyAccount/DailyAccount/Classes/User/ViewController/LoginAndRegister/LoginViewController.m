//
//  LoginViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"
#import "FindPwdViewController.h"
#import <AVOSCloud.h>
#import "UserViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginViewController

- (void)loadView
{
    self.loginView = [LoginView new];
    self.view = self.loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loginView.backButton addTarget:self action:@selector(backButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.registerButton addTarget:self action:@selector(registerButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.findPwdButton addTarget:self action:@selector(findPwdButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.loginButton addTarget:self action:@selector(loginButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 登录按钮点击事件
- (void)loginButtonDidClicked:(UIButton *)sender
{
    [AVUser logInWithUsernameInBackground:self.loginView.userNameTF.text password:self.loginView.userPwdTF.text block:^(AVUser *user, NSError *error) {
        if (user != nil)
        {
            // 是否有用户名
            [_delegate changeUserName:self.loginView.userNameTF.text];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
//    [AVUser logInWithMobilePhoneNumberInBackground:self.loginView.userNameTF.text password:self.loginView.userPwdTF.text block:^(AVUser *user, NSError *error) {
//        // 是否有手机号
//        if (user != nil)
//        {
//            [_delegate changeUserName:self.loginView.userNameTF.text];
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//    }];
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不匹配" preferredStyle:UIAlertControllerStyleAlert];
//    [self presentViewController:alert animated:YES completion:nil];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
//    [alert addAction:cancelAction];
}

#pragma mark 返回按钮点击事件
- (void)backButtonDidClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 注册按钮点击事件
- (void)registerButtonDidClicked:(UIButton *)sender
{
    RegisterViewController *registerVC = [RegisterViewController new];
    [self.navigationController pushViewController:registerVC animated:YES];
}

#pragma mark 忘记密码
- (void)findPwdButtonDidClicked:(UIButton *)sender
{
    FindPwdViewController *findPwdVC = [FindPwdViewController new];
    [self.navigationController pushViewController:findPwdVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
