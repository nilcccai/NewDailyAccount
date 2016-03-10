//
//  AboutViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/10.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutView.h"

@interface AboutViewController ()

@property (nonatomic, strong) AboutView *aboutView;

@end

@implementation AboutViewController

- (void)loadView
{
    self.aboutView = [AboutView new];
    self.view = self.aboutView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
