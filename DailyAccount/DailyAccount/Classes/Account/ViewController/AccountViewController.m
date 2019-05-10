//
//  AccountViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AccountViewController.h"
#import "CollectionViewCell.h"
#import "ListViewController.h"
@interface AccountViewController ()<UICollectionViewDataSource,UICollectionViewDelegate, UITextFieldDelegate>
@property(nonatomic,strong) UISegmentedControl *segment;
@property(nonatomic,strong) UICollectionView *LeftCollection;

@property (nonatomic, strong) NSMutableArray *buttonName;
@property (nonatomic, strong) NSMutableArray *picName;

@property (nonatomic, strong) NSMutableArray *name;
@property (nonatomic, strong) NSMutableArray *picture;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *classImage;
@property (nonatomic, strong) UILabel *className;
@property (nonatomic, strong) UITextField *priceTF;
@property (nonatomic, strong) UIButton *saveButton;

@property(nonatomic,strong)NSMutableArray *mutbleArray;
@property(nonatomic,strong)NSMutableDictionary *dict;

@property(nonatomic,copy)NSString *str;

@property(nonatomic,copy)NSString *index;

@end

@implementation AccountViewController


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


//收入
- (NSMutableArray *)buttonName
{
    if (_buttonName == nil)
    {
        _buttonName = [NSMutableArray arrayWithObjects:@"工资", @"生活费", @"红包", @"零花", @"外快", @"投资", @"借入", @"奖金", @"还款", @"报销", @"现金", @"退款", @"支付宝", @"其他", nil];
    }
    return _buttonName;
}
- (NSMutableArray *)picName
{
    if (_picName == nil)
    {
        _picName = [NSMutableArray arrayWithObjects:@"gongzi", @"shenghuo", @"hongbao", @"linghuaqian", @"waikuai", @"shouru", @"jieru", @"jiangjin", @"huankuan", @"baoxiao", @"xianjin", @"tuikuan", @"zhifubao", @"shouruqita", nil];
    }
    return _picName;
}

//支出
- (NSMutableArray *)name
{
    if (_name == nil)
    {
        _name = [NSMutableArray arrayWithObjects:@"一般", @"餐饮", @"交通", @"酒水", @"水果", @"零食", @"买菜", @"服饰", @"日用品", @"话费", @"化妆品", @"房租", @"电影", @"淘宝", @"还钱", @"红包", @"药品", @"其他", nil];
    }
    return _name;
}
- (NSMutableArray *)picture
{
    if (_picture == nil)
    {
        _picture = [NSMutableArray arrayWithObjects:@"yiban", @"canyin", @"jiaotong", @"jiushui", @"shuiguo", @"lingshi", @"maicai", @"yifu", @"shenghuo", @"huafei", @"huazhuang", @"fangzu", @"dianying", @"taobao", @"huanqian", @"hongbao", @"yaopin", @"zhichuqita", nil];
    }
    return _picture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DAScreenWidth, 64)];
    navigationView.backgroundColor = DABlueColor;
    [self.view addSubview:navigationView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(20, 20, 32, 32);
    [backButton setTitle:nil forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"userDown"] forState:UIControlStateNormal];
    [navigationView addSubview:backButton];
    [backButton addTarget:self action:@selector(backButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];

    self.view.backgroundColor = [UIColor whiteColor];
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, DAScreenWidth, 108)];
    [self.view addSubview:self.headerView];
    
    [self createHeaderView];
    [self creatLeftView];
    
    self.LeftCollection.delegate = self;
    self.LeftCollection.dataSource = self;
    [self.LeftCollection registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        self.segment = [[UISegmentedControl alloc]initWithItems:@[@"收入",@"支出"]];
    self.segment.backgroundColor = [UIColor clearColor];
    self.segment.tintColor = DABlueColor;
    self.segment.frame = CGRectMake(self.view.frame.size.width * 0.5 - ((self.view.frame.size.width * 0.55)*0.5),20, self.view.frame.size.width * 0.55, 25);
    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(segementClick:) forControlEvents:UIControlEventValueChanged];
    [self.headerView addSubview:self.segment];
    
    [self.LeftCollection reloadData];
    
    self.priceTF.delegate = self;
    
    [self.saveButton addTarget:self action:@selector(saveButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"123");
}

#pragma mark 返回按钮点击事件
- (void)backButtonDidClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 保存按钮
- (void)saveButtonDidClicked:(UIButton *)sender
{
    [self.dict setValue:self.className.text forKey:@"name"];
    [self.dict setValue:self.priceTF.text forKey:@"money"];
    [self.dict setValue:self.str forKey:@"image"];
    [self.dict setValue:self.index forKey:@"index"];
    
    //[self.mutbleArray addObject:self.dict];
    NSLog(@"++++++%@",self.mutbleArray);
    if ([self.delegate respondsToSelector:@selector(sendMessageToAlarmWith:)]) {
        [self.delegate sendMessageToAlarmWith:self.dict];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark 标签
-(void)segementClick:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        [self.LeftCollection reloadData];
        self.classImage.image = [UIImage imageNamed:@"gongzi"];
        self.className.text = @"工资";
    }else{
        [self.LeftCollection reloadData];
        self.classImage.image = [UIImage imageNamed:@"yiban"];
        self.className.text = @"一般";
    }
    
    NSLog(@"点击");
    
}

#pragma mark 头视图
- (void)createHeaderView
{
    self.classImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, 70, 32, 32)];
    self.classImage.image = [UIImage imageNamed:@"gongzi"];
    [self.headerView addSubview:self.classImage];
    
    self.className = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.classImage.frame) + 4, CGRectGetMinY(self.classImage.frame), 55, self.classImage.frame.size.height)];
    self.className.text = @"工资";
    [self.headerView addSubview:self.className];
    
    self.priceTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.className.frame), 71, DAScreenWidth - 160, 30)];
    self.priceTF.placeholder = @"0.00";
    self.priceTF.borderStyle = UITextBorderStyleRoundedRect;
    [self.headerView addSubview:self.priceTF];
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.saveButton.frame = CGRectMake(CGRectGetMaxX(self.priceTF.frame) + 10, 71, 30, 30);
    [self.saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.saveButton setTintColor:DABlueColor];
    [self.headerView addSubview:self.saveButton];
}
-(void)creatLeftView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake((DAScreenWidth - 30) / 5, (DAScreenWidth - 30) / 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.LeftCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0,184, self.view.frame.size.width, self.view.frame.size.height -64) collectionViewLayout:layout];
    self.LeftCollection.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.LeftCollection];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (self.segment.selectedSegmentIndex == 0) {
        
        return  self.buttonName.count;
        
    }else{
        return  self.name.count;
        
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor redColor];
    if (self.segment.selectedSegmentIndex == 0) {
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.picName[indexPath.row]]];
        cell.name.text = self.buttonName[indexPath.row];
        
        self.index = [NSString stringWithFormat:@"%ld",(long)self.segment.selectedSegmentIndex];
    }else if(self.segment.selectedSegmentIndex == 1){
        
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.picture[indexPath.row]]];
        cell.name.text = self.name[indexPath.row];
        self.index = [NSString stringWithFormat:@"%ld",(long)self.segment.selectedSegmentIndex];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.segment.selectedSegmentIndex == 0)
    {
        self.classImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.picName[indexPath.row]]];
        self.className.text = self.buttonName[indexPath.row];
        
        self.str = self.picName[indexPath.row];
    }
    else
    {
        self.classImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.picture[indexPath.row]]];
        self.className.text = self.name[indexPath.row];
        
        self.str = self.picture[indexPath.row];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
