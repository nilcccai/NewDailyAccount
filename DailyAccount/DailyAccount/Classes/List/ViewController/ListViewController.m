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
#import "ListModel.h"
#import "ListHeaderView.h"
#import "SRModel.h"
#import "AccountBookViewController.h"
#import "accountCell.h"
@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate,AccountViewControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *accountView;
@property(nonatomic,strong)UIView *mainView;
@property(nonatomic,strong)UIButton *alarmButton;
@property(nonatomic,strong)UIButton *accountButton;
@property(nonatomic,strong)UIButton *calendarButton;
@property(nonatomic,assign)NSInteger tag;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)CGRect rect;
@property(nonatomic,strong)NSMutableArray *tempArray;
@property(nonatomic,strong)NSMutableArray *tempArray1;
@property(nonatomic,copy)NSString *index;
@property(nonatomic,strong)UILabel *zjLabel;
@property(nonatomic,strong)UILabel *srLabel;
@property(nonatomic,strong)UILabel *zcLabel;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)NSMutableArray *array;

@property(nonatomic,strong)NSMutableArray *arr1;
@property(nonatomic,copy) NSString * str;
@property(nonatomic,copy) NSString * str1;

@property(nonatomic,strong)NSMutableArray * mutArray10;
@end
@implementation ListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setAccountView];
    [self createHeaderView];
    self.tag = 100;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.accountView.dataSource = self;
    self.accountView.delegate = self;
    
    [self.accountView registerClass:[accountCell class] forCellWithReuseIdentifier:@"collection"];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ListTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"记一笔" style:UIBarButtonItemStylePlain target:self action:@selector(addButtonDidClicked:)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = addButton;
    [self.tableView reloadData];
    
//    注册一个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:@"zhangben" object:nil];
}
#pragma mark 通知传值
-(NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
-(void)action:(NSNotification *)notification
{
    NSDictionary *dic = [notification userInfo];
    self.array = dic[@"name"];
    NSLog(@"账本：%@",self.array);
}
#pragma mark 添加tableView的头部
-(void)createHeaderView
{
    self.headerView = [ListHeaderView listHeaderView];
    self.headerView.frame = CGRectMake(0, 0,DAScreenWidth,DAScreenWidth/3 +30);
    self.tableView.tableHeaderView = self.headerView;
    self.zjLabel = [[UILabel alloc] initWithFrame:CGRectMake(DAScreenWidth/3 + 10,25, DAScreenWidth/3 - 20,DAScreenWidth/3 - 20)];
    self.zjLabel.text = @"月预算\n 394";
    self.zjLabel.numberOfLines = 0;
    self.zjLabel.textAlignment = NSTextAlignmentCenter;
    self.zjLabel.backgroundColor = DABlueColor;
    self.zjLabel.layer.masksToBounds = YES;
    self.zjLabel.layer.cornerRadius = (DAScreenWidth/3 - 20)/2;
    [self.headerView addSubview:self.zjLabel];
    self.zcLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.zjLabel.frame) + 20, 50,self.zjLabel.frame.size.width, 50)];
    self.zcLabel.textAlignment = NSTextAlignmentCenter;
    
    self.zcLabel.text = @"3月份支出\n113.00";
    
    
    self.zcLabel.numberOfLines = 0;
    [self.headerView addSubview:self.zcLabel];
    
    self.srLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.zjLabel.frame) - self.zjLabel.frame.size.width, 50, self.zjLabel.frame.size.width, 50)];
    
    self.srLabel.text = @"3月份收入\n113.00";
    
    
    self.srLabel.numberOfLines = 0;
    self.srLabel.textAlignment = NSTextAlignmentCenter;
    [self.headerView addSubview:self.srLabel];
    
    self.lineLabel =[[UILabel alloc] initWithFrame:CGRectMake((DAScreenWidth-2)/2, CGRectGetMaxY(self.zjLabel.frame), 2, self.headerView.frame.size.height - CGRectGetMaxY(self.zjLabel.frame))];
    self.lineLabel.backgroundColor = DABlueColor;
    [self.headerView addSubview:self.lineLabel];

}

#pragma mark 执行代理方法
-(NSMutableArray *)tempArray
{
    if (!_tempArray) {
        _tempArray  = [NSMutableArray array];
    }
    return _tempArray;
}
-(NSMutableArray *)tempArray1
{
    if (!_tempArray1) {
        _tempArray1  = [NSMutableArray array];
    }
    return _tempArray1;
}

-(NSMutableArray *)mutArray10
{
    if (!_mutArray10) {
        _mutArray10 = [NSMutableArray array];
    }
    return _mutArray10;
}
-(void)sendMessageToAlarmWith:(NSMutableDictionary *)mutArray
{

    [self.mutArray10 addObject:mutArray];
    DALog(@"mutArray1 :%@",self.mutArray10);
    
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    NSMutableDictionary *dd = [NSMutableDictionary dictionary];
    for (NSDictionary *dic in self.mutArray10) {
        self.index = dic[@"index"];
        if ([self.index isEqualToString:@"0"]) {
            SRModel *srModel = [[SRModel alloc] init];
            [srModel setValuesForKeysWithDictionary:dic];
            [self.tempArray addObject:srModel];
           ListModel *model = [[ListModel alloc] init];
            for (NSDictionary *ddic in self.mutArray10) {
                self.str = ddic[@"image"];
            }
            [d setValue:self.str forKey:@"image"];
            [model setValuesForKeysWithDictionary:d];
           [self.tempArray1 addObject:model];
        }else{
            ListModel *model = [[ListModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.tempArray1 addObject:model];
            SRModel *srModel = [[SRModel alloc] init];
            for (NSDictionary *dict in self.mutArray10) {
                self.str1 = dict[@"image"];
            }
            [dd setValue:self.str1 forKey:@"image"];
            [srModel setValuesForKeysWithDictionary:dd];
            [self.tempArray addObject:srModel];
        }
    }
    
    [self.tableView reloadData];
}
#pragma mark 记账
- (void)addButtonDidClicked:(UIBarButtonItem *)sender
{
    AccountViewController *accountVC = [AccountViewController new];
    accountVC.delegate = self;
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
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake(DAScreenWidth/3,200);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.accountView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,-200, DAScreenWidth,200) collectionViewLayout:layout];
    self.accountView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.accountView];
    
    self.rect = CGRectMake(0,164, DAScreenWidth, DAScreenHeight - 164);
    self.tableView = [[UITableView alloc] initWithFrame:self.rect style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
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
    [self.accountView reloadData];
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

#pragma mark ecollectionView 代理方法
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    accountCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    
   cell.picture.image = [UIImage imageNamed:@"book"];
   cell.name.text = self.array[indexPath.row];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}

#pragma mark collection 被选中的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.accountButton setTitle:self.array[indexPath.row] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.accountView.frame = CGRectMake(0, -200, DAScreenWidth,200);
        self.mainView.frame = CGRectMake(0,64, DAScreenWidth, 100);
        self.tableView.frame = self.rect;
    }];
    
    
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
    return self.tempArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.srModel = self.tempArray[indexPath.row];
    cell.model = self.tempArray1[indexPath.row];


    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}







@end
