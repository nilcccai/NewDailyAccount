//
//  ReportViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ReportViewController.h"
#import "ReportView.h"
#import "ReportDetailViewController.h"
#import "Data.h"
#import "ReportCell.h"
#import "ReportModel.h"
#import "CalendarViewController.h"

#define PIE_HEIGHT 210


@interface ReportViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *valueArray;
@property (nonatomic,strong) NSMutableArray *colorArray;
@property (nonatomic,strong) NSMutableArray *valueArray2;
@property (nonatomic,strong) NSMutableArray *colorArray2;

//内饼视图
@property (nonatomic,strong) PieChartView   *pieChartView;
//底层容器视图
@property (nonatomic,strong) UIView *pieContainer;
@property (nonatomic)BOOL inOut;
@property (nonatomic,strong) UILabel *selLabel;

@property (nonatomic,strong)UITableView *tableView;
//存放收支明细信息
@property(nonatomic,strong)NSMutableArray *listArray;
//
@property (nonatomic,strong)NSMutableDictionary *dic;
//存放报表收支分类标题头名称
@property (nonatomic,strong)NSMutableArray *headerArr;

@property(nonatomic,strong)NSDate *date;


@end

@implementation ReportViewController

-(void)loadView{
    
    self.reportView = [[ReportView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.reportView;
}

//重写
- (void)dealloc
{
    self.valueArray = nil;
    self.colorArray = nil;
    self.valueArray2 = nil;
    self.colorArray2 = nil;
    self.pieContainer = nil;
    self.selLabel = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"分期报表";
    self.inOut = YES;


    self.date = [NSDate date];
    //注册
    [self.reportView.tableView registerClass:[ReportCell class] forCellReuseIdentifier:@"listCell"];
    
    //指定代理
    self.reportView.tableView.delegate = self;
    self.reportView.tableView.dataSource = self;
    
    //初始化
    self.listArray = [NSMutableArray array];
    self.tableData = [[NSMutableArray alloc] init];
    
    //支出饼图占比
    self.valueArray = [[NSMutableArray alloc] initWithObjects:
                       [NSNumber numberWithInt:2],
                       [NSNumber numberWithInt:3],
                       [NSNumber numberWithInt:2],
                       [NSNumber numberWithInt:3],
                       [NSNumber numberWithInt:3],
                       [NSNumber numberWithInt:4],
                       nil];
    
    //收入饼图占比
    self.valueArray2 = [[NSMutableArray alloc] initWithObjects:
                        [NSNumber numberWithInt:10],
                        [NSNumber numberWithInt:2],
                        [NSNumber numberWithInt:2],
                        nil];
    
    //支出饼图颜色
    self.colorArray = [NSMutableArray arrayWithObjects:
                       [UIColor colorWithHue:((0/8)%20)/20.0+0.02 saturation:(0%8+3)/10.0 brightness:91/100.0 alpha:1],
                       [UIColor colorWithHue:((1/8)%20)/20.0+0.02 saturation:(1%8+3)/10.0 brightness:91/100.0 alpha:1],
                       [UIColor colorWithHue:((2/8)%20)/20.0+0.02 saturation:(2%8+3)/10.0 brightness:91/100.0 alpha:1],
                       [UIColor colorWithHue:((3/8)%20)/20.0+0.02 saturation:(3%8+3)/10.0 brightness:91/100.0 alpha:1],
                       [UIColor colorWithHue:((4/8)%20)/20.0+0.02 saturation:(4%8+3)/10.0 brightness:91/100.0 alpha:1],
                       [UIColor colorWithHue:((5/8)%20)/20.0+0.02 saturation:(5%8+3)/10.0 brightness:91/100.0 alpha:1],
                       nil];
    
    //收入饼图颜色
    self.colorArray2 = [[NSMutableArray alloc] initWithObjects:
                        [UIColor purpleColor],
                        [UIColor orangeColor],
                        [UIColor magentaColor],
                        nil];
    
    for (int i = 100; i < 103; i ++)
    {
        UIButton *button = [self.reportView viewWithTag:i];
        [button addTarget:self action:@selector(dateDidClickAction:)  forControlEvents:UIControlEventTouchDown];
    }
    
#pragma mark ----- 显示各部分占比
/*
//    self.pieContainer = [[UIView alloc]initWithFrame:pieFrame];
//    self.pieChartView = [[PieChartView alloc]initWithFrame:self.pieContainer.bounds withValue:self.valueArray withColor:self.colorArray];
//    self.pieChartView.delegate = self;
////    [self.pieContainer addSubview:self.pieChartView];
//    [self.pieChartView setAmountText:@"-2456.0"];
//    [self.view addSubview:self.pieContainer];
    
#pragma mark ----- 显示各部分占比
    
    //add selected view
//    UIImageView *selView = [[UIImageView alloc]init];
//    selView.image = [UIImage imageNamed:@"select.png"];
//    selView.frame = CGRectMake((self.view.frame.size.width - selView.image.size.width/2)/2, self.pieContainer.frame.origin.y + self.pieContainer.frame.size.height, selView.image.size.width/2, selView.image.size.height/2);
//    [self.view addSubview:selView];
//    
//    self.selLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 24, selView.image.size.width/2, 21)];
//    self.selLabel.backgroundColor = [UIColor clearColor];
//   self.selLabel.textAlignment = NSTextAlignmentCenter;
//    self.selLabel.font = [UIFont systemFontOfSize:17];
//    self.selLabel.textColor = [UIColor whiteColor];
//    [selView addSubview:self.selLabel];
//    [self.pieChartView setTitleText:@"支出总计"];
//    self.view.backgroundColor = [self colorFromHexRGB:@"f3f3f3"];
    
*/
    //刷新 tableView
//    [self.tableView reloadData];
    [self makedata];
}


//日历按钮
-(void)dateDidClickAction:(UIButton *)sender
{
    if (sender.tag == 100)
    {
        if ([self doesN] <= 10)
            if ([self doesN] == 1)
            {
                [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(5, 2) withString:@"12"]  forState:UIControlStateNormal] ;
                [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(0, 4) withString:[NSString stringWithFormat:@"%ld",[self getYear]-1]]  forState:UIControlStateNormal] ;
            }
            else
                [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(5, 2) withString:[NSString stringWithFormat:@"0%ld",[self doesN]-1]]  forState:UIControlStateNormal] ;
        else
                [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(5, 2) withString:[NSString stringWithFormat:@"%ld",[self doesN]-1]]  forState:UIControlStateNormal] ;
        _date = [NSDate dateWithTimeInterval:-24*60*60*30 sinceDate:_date];
        NSRange days = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:kCFCalendarUnitMonth forDate:_date];
        [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(11, 2) withString:[NSString stringWithFormat:@"%lu",days.length]]  forState:UIControlStateNormal] ;
        
        
    }
    if (sender.tag == 101)
    {
        PWSCalendarViewController *calendarVC = [[PWSCalendarViewController alloc] init];
        UINavigationController *calendarNC = [[UINavigationController alloc]initWithRootViewController:calendarVC];
        calendarNC.title = @"选择时间";
        [self presentViewController:calendarNC animated:YES completion:nil];
    }
    if (sender.tag == 102)
    {
        if ([self doesN] < 9)
            [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(5, 2) withString:[NSString stringWithFormat:@"0%ld",[self doesN]+1]]  forState:UIControlStateNormal] ;
        else
            if ([self doesN] == 12)
            {
                [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(5, 2) withString:@"01"]forState:UIControlStateNormal] ;
                [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(0, 4) withString:[NSString stringWithFormat:@"%ld",[self getYear]+1]]  forState:UIControlStateNormal] ;
            }
            else
                 [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(5, 2) withString:[NSString stringWithFormat:@"%ld",[self doesN]+1]]  forState:UIControlStateNormal] ;
        self.date = [NSDate dateWithTimeInterval:24*60*60*30 sinceDate:self.date];
        NSRange days = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:kCFCalendarUnitMonth forDate:self.date];
        [self.reportView.dateButton setTitle:[[self.reportView.dateButton currentTitle]stringByReplacingCharactersInRange:NSMakeRange(11, 2) withString:[NSString stringWithFormat:@"%lu",days.length]]  forState:UIControlStateNormal] ;
    }
}
//获取日期
-(NSString *)getdate
{
    NSString *dateStr = [self.reportView.dateButton currentTitle];
    NSString *a = [dateStr substringWithRange:NSMakeRange(5, 2)];
    return a;
}

//计算日期
-(NSInteger)doesN
{
    return  [[self getdate] integerValue];
}
//获取年份
-(NSInteger)getYear
{
    NSString *dateStr = [self.reportView.dateButton currentTitle];
    NSString *a = [dateStr substringWithRange:NSMakeRange(0, 4)];
    return  [a integerValue];
}

-(void)makedata{
//    
//    ReportModel *m1 = [[ReportModel alloc] init];
//    m1.s_image = [UIImage imageNamed:@"ic_milestone_heart"];;
//    m1.category = @"零食";
//    m1.percentage = @"15%";
//    m1.money = @"88";
//    [self.tableData addObject:m1];
//    
//    
}

- (UIColor *)colorFromHexRGB:(NSString *) inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

//环形各部分所占比例
- (void)selectedFinish:(PieChartView *)pieChartView index:(NSInteger)index percent:(float)per
{
    self.selLabel.text = [NSString stringWithFormat:@"%2.2f%@",per*100,@"%"];
}

- (void)onCenterClick:(PieChartView *)pieChartView
{
    
    self.inOut = !self.inOut;
    self.pieChartView.delegate = nil;
    [self.pieChartView removeFromSuperview];
    
    
    //比例关系计算
//    self.pieChartView = [[PieChartView alloc]initWithFrame:self.pieContainer.bounds withValue:self.inOut?self.valueArray:self.valueArray2 withColor:self.inOut?self.colorArray:self.colorArray2];
    
    self.pieChartView = [[PieChartView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - PIE_HEIGHT) / 2, 15, PIE_HEIGHT-18, PIE_HEIGHT-18) withValue:self.inOut?self.valueArray:self.valueArray2 withColor:self.inOut?self.colorArray:self.colorArray2];
    
    
    self.pieChartView.delegate = self;
    [self.pieContainer addSubview:self.pieChartView];
    [self.pieChartView reloadChart];
    
    if (self.inOut) {
        [self.pieChartView setTitleText:@"支出总计"];
        [self.pieChartView setAmountText:@"-2456.0"];
        
    }else{
        [self.pieChartView setTitleText:@"收入总计"];
        [self.pieChartView setAmountText:@"+567.23"];
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [self.pieChartView reloadChart];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.pieContainer = [[UIView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - PIE_HEIGHT) / 2, 60, PIE_HEIGHT, PIE_HEIGHT+20)];
    self.pieChartView = [[PieChartView alloc]initWithFrame:CGRectMake(self.pieContainer.frame.origin.x, 15, PIE_HEIGHT-18, PIE_HEIGHT-18) withValue:self.valueArray withColor:self.colorArray];
    [self.pieContainer addSubview:self.pieChartView];
    
    //版本类型标签
    UILabel *classifyLable = [[UILabel alloc]initWithFrame:CGRectMake(self.pieContainer.frame.origin.x, 0, 60, 15)];
    classifyLable.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 0);
    classifyLable.text = @"默认版本";
    classifyLable.font = [UIFont systemFontOfSize:13];
    classifyLable.textColor = [UIColor darkGrayColor];
    [self.pieContainer addSubview:classifyLable];

    
    self.pieChartView.delegate = self;
    [self.pieContainer addSubview:self.pieChartView];
    [self.pieChartView setAmountText:@"-2456.0"];
    [self.pieChartView setTitleText:@"支出总计"];
    [self.tableView reloadData];
    self.reportView.tableView.tableHeaderView = self.pieContainer;
}

#pragma mark - UITableViewDelegate 和 UITableViewDataSource 实现协议

//分组个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.listArray.count;
    
    return 10;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReportCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
//    cell.textLabel.text = self.listArray[indexPath.row];
    
//    ReportModel *model = self.data[indexPath.row];
//    if (!cell) {
//        cell = [[ReportCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listCell"];
//    }

    
//    cell.imageView.image = model.s_image;
//    cell.lableName.text = model.category;
//    cell.moneyLable.text = model.percentage;
//    cell.moneyLable.text = model.money;
    
    
//    if (cell == nil) {
//        //通过xib的名称加载自定义的cell
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
//    }
    
    //添加测试数据
//    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
//    
//    //测试图片
//    cell.imageView.image = [UIImage imageNamed:@"ic_milestone_heart.png"];
//    cell.textLabel.text = @"123";
    return cell;
}

//传入标题头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.headerArr objectAtIndex:section];

}

//点击每一行cell进入详细页面

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [Data sharedHandel].listTitle = cell.textLabel.text;
    
    ReportDetailViewController *reportDetailVC = [[ReportDetailViewController alloc] init];
    reportDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:reportDetailVC animated:YES];
    
}

@end



