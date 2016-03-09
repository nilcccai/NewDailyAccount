//
//  AddController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AddController.h"
#import "AddCell.h"
#import "RemindViewController.h"
#import "ExpireViewController.h"
#import "TimeViewController.h"
#import "MoneyViewController.h"
@interface AddController ()<RemindViewControllerDelegate,MoneyViewControllerDelegate,TimeViewControllerDelegate,ExpireViewControllerDelegate>
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,copy)NSString *string;
@property(nonatomic,copy)NSString *moneyStr;
@property(nonatomic,copy)NSString *timeStr;
@property(nonatomic,copy)NSString *expireStr;

@property(nonatomic,strong)NSMutableArray *mutbleArray;
@property(nonatomic,strong)NSMutableDictionary *dict;
@end
@implementation AddController

-(NSMutableArray *)mutbleArray
{
    if (_mutbleArray == nil) {
        _mutbleArray = [NSMutableArray array];
        
    }
    return _mutbleArray;
}

-(NSMutableDictionary *)dict
{
    if (_dict == nil) {
        _dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setUpNavtion];
}
-(void)setUpNavtion
{
    self.navigationItem.title = @"新建提醒";
    //设置导航栏右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction)];
//    注册cell
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AddCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
    self.titleArray = @[@"提醒名称",@"到期日期",@"提醒时间",@"金额"];
}
#pragma mark 提醒名称执行代理方法
-(void)sendMessageToFirstWith:(NSString *)str
{
    self.string = str;
    [self.tableView reloadData];
}
#pragma mark 提醒名称执行代理方法
-(void)sendMessageToMoneytWith:(NSString *)str
{
    self.moneyStr = str;
    [self.tableView reloadData];
}
#pragma mark 提醒日期执行的方法
-(void)sendMessageToExpireWith:(NSString *)str
{
    self.expireStr = str;
    [self.tableView reloadData];
}
#pragma mark 提醒时间执行的方法
-(void)sendMessageToTimeWith:(NSString *)str
{
    self.timeStr = str;
    [self.tableView reloadData];
}

#pragma mark 导航栏右侧按钮点击事件
-(void)rightBarButtonItemAction
{
    if (self.string == nil || self.expireStr == nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"提醒的内容不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
    }else{
        
    [self.dict setObject:self.string forKey:@"name"];
    [self.dict setObject:self.expireStr forKey:@"time"];
    
    DALog(@"------%@",_dict);
    self.mutbleArray = [NSMutableArray arrayWithObjects:self.dict, nil];
    
    if ([self.delegate respondsToSelector:@selector(sendMessageToAlarmWith:)]) {
        [self.delegate sendMessageToAlarmWith:self.mutbleArray];
    }

    [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}
#pragma mark 设置cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[AddCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row == 0) {
        cell.detailTextLabel.text = self.string;
        }
    if (indexPath.row == 1) {
        cell.detailTextLabel.text = self.expireStr;
    }
    if (indexPath.row == 2) {
        cell.detailTextLabel.text = self.timeStr;
    }
    if (indexPath.row == 3) {
        cell.detailTextLabel.text = self.moneyStr;
    }
    
    return cell;
}
#pragma mark 点击cell事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        RemindViewController *rec = [[RemindViewController alloc] init];
        rec.delegate = self;
        [self.navigationController pushViewController:rec animated:YES];
    }else  if(indexPath.row == 1){
        ExpireViewController *evc = [[ExpireViewController alloc] init];
        evc.delegate = self;
        [self.navigationController presentViewController:evc animated:YES
                                              completion:nil];
    }else if (indexPath.row == 2){
        TimeViewController *tvc = [[TimeViewController alloc] init];
        tvc.delegate = self;
        [self.navigationController presentViewController:tvc animated:YES completion:nil];
    }else if (indexPath.row == 3){
        MoneyViewController *MVC = [[MoneyViewController alloc] init];
        MVC.delegate = self;
        [self.navigationController pushViewController:MVC animated:YES];
    }
}


#pragma mark 

@end
