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
