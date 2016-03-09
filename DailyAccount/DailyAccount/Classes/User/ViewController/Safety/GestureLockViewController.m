//
//  GestureLockViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "GestureLockViewController.h"
#import "GestureLockView.h"
#import "AppDelegate.h"

#define lableArray @[@"创建密码", @"修改密码", @"清除密码"]

@interface GestureLockViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *heightArray;
}

@property (nonatomic, strong) GestureLockView *gestureLockView;

@end

@implementation GestureLockViewController

- (void)loadView
{
    self.gestureLockView = [[GestureLockView alloc] init];
    self.view = self.gestureLockView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手势锁";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.gestureLockView.list registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SafetyList"];
    self.gestureLockView.list.delegate = self;
    self.gestureLockView.list.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([LLLockPassword loadLockPassword])
    {
        heightArray = @[@"0", @"44", @"44"];
    }
    else
    {
        heightArray = @[@"44", @"0", @"0"];
    }
    [self.gestureLockView.list reloadData];
}

#pragma mark - Table view data source

#pragma mark 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SafetyList" forIndexPath:indexPath];
    cell.textLabel.text = lableArray[indexPath.row];
    cell.clipsToBounds = YES;
    return cell;
}

#pragma mark cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AppDelegate* ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    switch (indexPath.row) {
        case 0:
            [ad showLLLockViewController:LLLockViewTypeCreate];
            break;
        case 1:
            [ad showLLLockViewController:LLLockViewTypeModify];
            break;
        default:
            [ad showLLLockViewController:LLLockViewTypeClean];
            break;
    }
}

#pragma mark cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((NSNumber*)(heightArray[indexPath.row])).floatValue;
}

@end
