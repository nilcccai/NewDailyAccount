//
//  FindPwdViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "FindPwdViewController.h"
#import "FindPwd.h"
#import "LoginViewController.h"

@interface FindPwdViewController ()

@property (nonatomic, strong) FindPwd *findPwdView;

@end

@implementation FindPwdViewController

- (void)loadView
{
    self.findPwdView = [FindPwd new];
    self.view = self.findPwdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.findPwdView.backButton addTarget:self action:@selector(backButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.findPwdView.resetButton addTarget:self action:@selector(resetButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark 返回
- (void)backButtonDidClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 重置
- (void)resetButtonDidClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
