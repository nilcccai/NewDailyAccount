//
//  UserViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "UserViewController.h"
#import "UserView.h"
#import "LoginViewController.h"
#import "SafetyViewController.h"
#import "AccountBookViewController.h"
#import <UMSocial.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface UserViewController ()<UITableViewDataSource, UITableViewDelegate, UMSocialUIDelegate>

@property (nonatomic, strong) UserView *userView;

@end

@implementation UserViewController

- (void)loadView
{
    self.userView = [UserView new];
    self.view = self.userView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userView.userTableView.delegate = self;
    self.userView.userTableView.dataSource = self;
    
    if ([UIScreen mainScreen].bounds.size.height > 550)
    {
        // tableView滚动
        self.userView.userTableView.scrollEnabled = NO;
    }
    
    [self.userView.userTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"userListCell"];
    
}

#pragma mark - Table view data source

#pragma mark 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

#pragma mark 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 1;
            break;
        }
        case 1:
        {
            return 4;
            break;
        }
        case 2:
        {
            return 1;
            break;
        }
        default:break;
    }
    return 0;
}

#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userListCell" forIndexPath:indexPath];
    switch (indexPath.section)
    {
        case 0:cell.textLabel.text = @"未登录";break;
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = @"安全";
                    break;
                case 1:
                    cell.textLabel.text = @"多账本";
                    break;
                case 2:
                    cell.textLabel.text = @"阅读模式";
                    break;
                case 3:
                    cell.textLabel.text = @"分享APP";
                    break;
                default:break;
            }
            break;
        }
        case 2:cell.textLabel.text = @"关于我们";break;
        default:break;
    }
    // cell箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // cell点击颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 100;
    }
    return 44;
}

#pragma mark cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            LoginViewController *loginVC = [LoginViewController new];
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:loginVC];
            [self presentViewController:nc animated:YES completion:nil];
            break;
        }
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    SafetyViewController *safetyVC = [SafetyViewController new];
                    safetyVC.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:safetyVC animated:YES];
                    break;
                }
                case 1:
                {
                    AccountBookViewController *accVC = [AccountBookViewController new];
                    accVC.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:accVC animated:YES];
                    break;
                }
                case 3:
                {
                    [UMSocialSnsService presentSnsIconSheetView:self
                                                         appKey:DAUmengAppKey
                                                      shareText:@"我在用“每天记”这款应用，你们也来试试吧"
                                                     shareImage:[UIImage imageNamed:@"test.jpg"]
                                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone,nil]
                                                       delegate:self];
                    break;
                }
                    
                default:
                    break;
            }
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
