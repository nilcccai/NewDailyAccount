//
//  ReportSpecificViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportSpecificViewController.h"
#import "ReportSpecificView.h"
#import "ReportSpecificViewController.h"
#import "AccountViewController.h"
#import "ReportSpecCell.h"
@interface ReportSpecificViewController ()<UITableViewDataSource>

@property(nonatomic,strong)ReportSpecificView *reportSpecificView;
@property(nonatomic,strong)NSMutableArray *dataArray;

//新建table
@property(nonatomic,strong)UITableView *table;
//底部按钮
@property (nonatomic, retain)UIView *tableFooterView;

@end

@implementation ReportSpecificViewController

-(void)loadView{
    [super loadView];
    self.reportSpecificView = [[ReportSpecificView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.reportSpecificView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    
    self.reportSpecificView.table.dataSource = self;
    
    //添加底部按钮
    [self addFooterButton];
    
    //添加 删除 按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
   [self makeData];
    
}


//添加底部按钮
-(void)addFooterButton
{
    
    AccountViewController *accountVC = [[AccountViewController alloc] init];
    [self.navigationController popToViewController:accountVC animated:YES];
}

//删除 按钮响应事件
-(void)rightItemAction:(UIBarButtonItem *)sender{
    
    //删除整个子视图
    [self.reportSpecificView.table removeFromSuperview];

    //弹窗提醒
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"删除成功！" message:nil delegate:nil cancelButtonTitle:@"OK!" otherButtonTitles:nil, nil];
    [alert show];
    
//    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否确认删除" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    
//    [alertView show];
    
}

-(void)makeData{
    //初始化dataArray
    self.dataArray = [NSMutableArray array];
    NSArray *arr1  = @[@"餐饮"];
    [self.dataArray addObject:arr1];
    NSArray *arr2 = @[@"账本",@"时间",@"账户",@"成员"];
    [self.dataArray addObject:arr2];
    
    
}

#pragma mark ----- UITableViewDataSource 方法实现
//定义多个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//指定由多少条数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        default:
            return 1;
            break;
    }
    
   // return 5;
}

//指定返回的每个cell的样式和格式
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    cell.detailTextLabel.text = @"55";
    //右对齐
   // cell.textAlignment = NSTextAlignmentRight;
    return cell;
}


@end
