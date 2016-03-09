//
//  ReportDetailViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportDetailViewController.h"
#import "Data.h"
#import "ReportViewController.h"
#import "ReportDetailView.h"
#import "ReportCell.h"
#import "ReportSpecificViewController.h"
#import "ReportModel.h"
#import "ReportDetailCell.h"

#define originalHeight 25.0f
#define newHeight 85.0f
#define isOpen @"85.0f"

@interface ReportDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
//创建字典,存放每一笔收支明细
@property (nonatomic, strong)NSMutableDictionary *dicDetail;
//定义数组,专门存放分组名
@property (nonatomic, strong)NSMutableArray *arraySection;

@end

@implementation ReportDetailViewController
{
    NSMutableDictionary *dicClicked;
    NSInteger count;
    CGFloat mHeight;
    NSInteger sectionIndex;
}

-(void)loadView{
//
    self.reportDetailView = [[ReportDetailView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.reportDetailView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //标题传值
    self.title = [Data sharedHandel].listTitle;
    
    //注册
    [self.reportDetailView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reportCell"];
    [self.view addSubview:self.reportDetailView.tableView];
    
    //指定代理
    self.reportDetailView.tableView.delegate = self;
    self.reportDetailView.tableView.dataSource = self;
    
    count = 0;
    mHeight = originalHeight;
    sectionIndex = 0;
    dicClicked = [NSMutableDictionary dictionaryWithCapacity:3];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource 实现协议
//多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 10;
}
//每个分组返回的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      static NSString *str = @"str";
   
      ReportDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
    cell = [[ReportDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
/*
 
 
//    if (indexPath.row == 0) {
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contentIndentifer];
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentIndentifer];
//        }
//        NSString *statisticsContent = [[NSString alloc] initWithString:@"   "];
//        cell.textLabel.font = [UIFont systemFontOfSize:12.0f];
//        cell.textLabel.text = statisticsContent;
//        cell.textLabel.textColor = [UIColor brownColor]
//        ;
//        cell.textLabel.opaque = NO; // 选中Opaque表示视图后面的任何内容都不应该绘制
////        cell.textLabel.numberOfLines = 8;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
//    }
 */
    
    cell.detailPicture.image = [UIImage imageNamed:@"ic_milestone_heart.png"];
    
 //   cell.textLabel.text = @"111111";
//    cell.textAlignment=UITextAlignmentRight;
//    count++;
    return cell;
}

//Section的标题栏高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 46;
    else
        return 30.0f;
}

//分组头标题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect headerFrame = CGRectMake(0, 0, 300, 30);
    CGFloat y = 2;
    if (section == 0) {
        headerFrame = CGRectMake(0, 0, 300, 100);
        y = 18;
    }
    UIView *headerView = [[UIView alloc] initWithFrame:headerFrame];
    //日期标签
    UILabel *dateLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, y, 240, 20)];
    dateLabel.font=[UIFont boldSystemFontOfSize:16.0f];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.backgroundColor=[UIColor clearColor];
    //显示当前的日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM月dd日";
    dateLabel.text = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate date]]];

    [headerView addSubview:dateLabel];
    return headerView;
}

#pragma mark - UITableViewDelegate 实现协议
//点击每一行cell进入详细页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        UITableViewCell *targetCell = [tableView cellForRowAtIndexPath:indexPath];
        if (targetCell.frame.size.height == originalHeight+1){
            [dicClicked setObject:isOpen forKey:indexPath];
        }
        else{
            [dicClicked removeObjectForKey:indexPath];
        }
        [self.reportDetailView.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
      [Data sharedHandel].listTitle = targetCell.textLabel.text;
        
    }
    NSLog(@"indexPath=%@",indexPath);
    NSLog(@"dicClicked=%@",dicClicked);
    
    
    ReportSpecificViewController *reportSpecificVC = [[ReportSpecificViewController alloc] init];
    [self.navigationController pushViewController:reportSpecificVC animated:YES];
}

//自适应高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if ([[dicClicked objectForKey:indexPath] isEqualToString: isOpen])
            return [[dicClicked objectForKey:indexPath] floatValue];
        else
            return originalHeight;
    }
    else {
        return 45.0f;
    }
}

@end
