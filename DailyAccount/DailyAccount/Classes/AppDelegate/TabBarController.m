//
//  TabBarController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "TabBarController.h"
#import "ListViewController.h"
#import "ReportViewController.h"
#import "UserViewController.h"
#import "AccountViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = DABlueColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    [self setUpChild:[ListViewController new] Image:[NSString stringWithFormat:@"mingxi-normal"] selected:[NSString stringWithFormat:@"mingxi-secleted"] title:@"明细"];
//    [self setUpChild:[AccountViewController new] Image:[NSString stringWithFormat:@"jizhang-normal"] selected:[NSString stringWithFormat:@"jizhang-selected"] title:@"记账"];
    [self setUpChild:[ReportViewController new] Image:[NSString stringWithFormat:@"baobiao-normal"] selected:[NSString stringWithFormat:@"baobiao-secleted"] title:@"报表"];
    [self setUpChild:[UserViewController new] Image:[NSString stringWithFormat:@"yonghu-normal"] selected:[NSString stringWithFormat:@"yonghu-secleted"] title:@"我的"];
}

- (void)setUpChild:(UIViewController *)vc
             Image:(NSString *)image
          selected:(NSString *)selectedImage
             title:(NSString *)title
{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.navigationController.navigationBar.barTintColor = DABlueColor;
    vc.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self addChildViewController:nv];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
