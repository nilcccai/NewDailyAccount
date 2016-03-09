//
//  SafetyViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "SafetyViewController.h"
#import "SafetyView.h"
#import "GestureLockViewController.h"
#import "FingerOCViewController.h"

@interface SafetyViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SafetyView *safetyView;

@end

@implementation SafetyViewController

- (void)loadView
{
    self.safetyView = [SafetyView new];
    self.view = self.safetyView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"安全";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.safetyView.safetyTabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"safeCell"];
    self.safetyView.safetyTabelView.delegate = self;
    self.safetyView.safetyTabelView.dataSource = self;
    self.safetyView.safetyTabelView.scrollEnabled = NO;
    
}

#pragma mark - Table view data source

#pragma mark 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

#pragma mark 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"safeCell" forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        cell.textLabel.text = @"手势锁";
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = @"指纹锁";
    }
    else
    {
        cell.textLabel.text = @"错误";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        GestureLockViewController *gestureVC = [GestureLockViewController new];
        [self.navigationController pushViewController:gestureVC animated:YES];
    }
    if (indexPath.section == 1)
    {
        FingerOCViewController *fingerVC = [FingerOCViewController new];
        [self.navigationController pushViewController:fingerVC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
