//
//  ListViewController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/6.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ListViewController.h"
#import "Masonry.h"
#import "AlarmButtonController.h"
#import "CalendarButtonController.h"
#import "ListTableViewCell.h"
#import "AccountViewController.h"

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIView *accountView;
@property(nonatomic,strong)UIView *mainView;
@property(nonatomic,strong)UIButton *alarmButton;
@property(nonatomic,strong)UIButton *accountButton;
@property(nonatomic,strong)UIButton *calendarButton;
@property(nonatomic,assign)NSInteger tag;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,assign)CGRect rect;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAccountView];
    self.tag = 100;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ListTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"记一笔" style:UIBarButtonItemStylePlain target:self action:@selector(addButtonDidClicked:)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = addButton;
}

#pragma mark 记账
- (void)addButtonDidClicked:(UIBarButtonItem *)sender
{
    AccountViewController *accountVC = [AccountViewController new];
    [self presentViewController:accountVC animated:YES completion:nil];
}

#pragma mark 添加显示记账的view
-(void)setAccountView
{
    //    添加主页面view
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(0,64, DAScreenWidth, 100)];
    //self.mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.mainView];
    //    添加账本选择的view
    self.accountView = [[UIView alloc] initWithFrame:CGRectMake(0,-200, DAScreenWidth,200)];
    //self.accountView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.accountView];
    
    self.rect = CGRectMake(0,164, DAScreenWidth, DAScreenHeight - 164);
    
    self.tableView = [[UITableView alloc] initWithFrame:self.rect style:UITableViewStylePlain];

    [self.view addSubview:self.tableView];

    
   // DALog(@"accountView %@",self.accountView.frame);
    
    //    添加闹铃
    self.alarmButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mainView addSubview:self.alarmButton];
    __weak ListViewController *listVC= self;
    [self.alarmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(30);
        make.width.and.height.mas_equalTo(32);
    }];
    
    [self.alarmButton setBackgroundImage:[UIImage imageNamed:@"naoling"] forState:UIControlStateNormal];
    [self.alarmButton addTarget:self action:@selector(alarmButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //    添加改变账本种类的按钮
    self.accountButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mainView addSubview:self.accountButton];
    [self.accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(listVC.view);
        make.top.mas_equalTo(30);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(32);
    }];
    [self.accountButton setTitle:@"默认账本" forState:UIControlStateNormal];
    [self.accountButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.accountButton.layer.masksToBounds = YES;
    self.accountButton.layer.cornerRadius = 16;
    self.accountButton.layer.borderWidth = 2;
    self.accountButton.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [self.accountButton addTarget:self action:@selector(accountButtonAction) forControlEvents:UIControlEventTouchUpInside];
    //    添加日历按钮
    self.calendarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mainView addSubview:self.calendarButton];
    [self.calendarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(30);
        make.width.and.height.mas_equalTo(32);
    }];
    
    [self.calendarButton setBackgroundImage:[UIImage imageNamed:@"rili"] forState:UIControlStateNormal];
    [self.calendarButton addTarget:self action:@selector(calendarButtonAction) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 闹铃的点击事件
-(void)alarmButtonAction
{
    AlarmButtonController *abc = [[AlarmButtonController alloc] init];
    abc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    UINavigationController *NV = [[UINavigationController alloc] initWithRootViewController:abc];
    [self.navigationController presentViewController:NV animated:YES completion:nil];
}
#pragma mark 添加改变账本种类的按钮
-(void)accountButtonAction
{
    if (self.tag == 100) {
        [UIView animateWithDuration:0.5 animations:^{
            self.accountView.frame = CGRectMake(0, 0, DAScreenWidth,200);
            self.mainView.frame = CGRectMake(0,200, DAScreenWidth,100);
            self.tableView.frame = CGRectMake(0,300, DAScreenWidth, DAScreenHeight - 300);
        }];
        
        self.tag++;
        
    }else if(self.tag == 101){
        [UIView animateWithDuration:0.5 animations:^{
            self.accountView.frame = CGRectMake(0, -200, DAScreenWidth,200);
            self.mainView.frame = CGRectMake(0,64, DAScreenWidth, 100);
            self.tableView.frame = self.rect;

        }];

        self.tag--;
    }
}
#pragma mark 添加日历按钮
-(void)calendarButtonAction
{
    CalendarButtonController *cbc = [[CalendarButtonController alloc] init];
    [self.navigationController pushViewController:cbc animated:YES];
    
    
}

#pragma mark cell数据源

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        //cell.textLabel.text = @"青龙白虎";
    return cell;
}

#pragma mark 插入数据
@end
