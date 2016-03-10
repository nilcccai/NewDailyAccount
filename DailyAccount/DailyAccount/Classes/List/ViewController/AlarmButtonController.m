//
//  AlarmButtonController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AlarmButtonController.h"
#import "AlarmButtonCellCell.h"
#import "AddController.h"
#import "AlarmModel.h"
@interface AlarmButtonController ()<AddControllerDelegate>
@property(nonatomic,strong)NSMutableArray *tempArray;
@property(nonatomic,strong)NSMutableDictionary *tempDic;
@end
@implementation AlarmButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置导航栏
    [self setUpNavtion];
//    设置cell的尾部视图
    [self setUpFootView];
    
//    注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlarmButtonCellCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}
#pragma mark 设置导航栏
-(void)setUpNavtion
{
    self.navigationItem.title = @"财务提醒";
    //    改变navigationController背景颜色
    self.navigationController.navigationBar.barTintColor = DABlueColor;
    //     改变navigationBar的字体颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"chaohao"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemAction)];
}

#pragma mark 实现执行的代理方法
-(NSMutableArray *)tempArray
{
    if (!_tempArray) {
        _tempArray  = [NSMutableArray array];
    }
    return _tempArray;
}
-(void)sendMessageToAlarmWith:(NSMutableArray *)mutArray
{
    for (NSDictionary *dic in mutArray) {
        AlarmModel *model = [[AlarmModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.tempArray addObject:model];
    }
    [self.tableView reloadData];
    DALog(@"=========%@",self.tempArray);
}
#pragma mark 模态返回
-(void)leftBarButtonItemAction
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 添加尾部视图
-(void)setUpFootView
{
    UIButton *footButton = [UIButton buttonWithType:UIButtonTypeCustom];
    footButton.frame = CGRectMake(0, 0, DAScreenWidth, 50);
    [footButton setTitle:@"添加提醒" forState:UIControlStateNormal];
    [footButton setTitleColor:DABlueColor forState:UIControlStateNormal];
    [footButton addTarget:self action:@selector(footButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = footButton;
}

#pragma mark cell尾部视图的点击事件
-(void)footButtonAction
{
    AddController *add = [[AddController alloc] init];
    add.delegate = self;
    [self.navigationController pushViewController:add animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSLog(@"%ld",self.tempArray.count);
    return self.tempArray.count;
    
}
#pragma mark 设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AlarmButtonCellCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

//
    cell.alarmModel = self.tempArray[indexPath.row];
 //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.markImageView.image = [UIImage imageNamed:@"kuohao"];
    
    return cell;
}
#pragma mark 选中cell 执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DALogFunc;
}

#pragma mark 设置每个section的头部高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
#pragma mark 设置每个section的尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

#pragma mark 指定编辑的类型（删除还是添加）
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

#pragma mark 提交编辑结果
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//     必须首先修改数据源
    [self.tempArray removeObjectAtIndex:indexPath.section];
//   修改UI
    [self.tableView reloadData];
}

#pragma mark 修改滑动删除时候显示字样，默认是“delete”
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}




@end
