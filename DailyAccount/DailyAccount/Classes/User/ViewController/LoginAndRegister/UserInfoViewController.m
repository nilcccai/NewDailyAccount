//
//  UserInfoViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoView.h"
#import <AVOSCloud.h>

@interface UserInfoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UserInfoView *userInfoView;
@property (nonatomic, strong) AVUser *currentUser;

@end

@implementation UserInfoViewController

- (void)loadView
{
    self.userInfoView = [UserInfoView new];
    self.view = self.userInfoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userInfoView.infoTableView.scrollEnabled = NO;
    self.userInfoView.infoTableView.delegate = self;
    self.userInfoView.infoTableView.dataSource = self;
    [self.userInfoView.infoTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"infoCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell" forIndexPath:indexPath];
    switch (indexPath.section)
    {
        case 0:
        {
            cell.textLabel.text = @"退出登录";
            cell.textLabel.textColor = DABlueColor;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
        }
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            [AVUser logOut];
            self.currentUser = [AVUser currentUser];
            [_delegate changeUserLogOutName:@"未登录"];
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        }
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
