//
//  AddBookViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AddBookViewController.h"

@interface AddBookViewController ()

@end

@implementation AddBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, DAScreenWidth, 30)];
    self.nameTF.placeholder = @"请输入账本名称";
    self.nameTF.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTF.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.nameTF];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonDidClicked:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

- (void)saveButtonDidClicked:(UIBarButtonItem *)sender
{
    
    if (self.nameTF.text.length != 0)
    {
        [_delegate AddBookName:self.nameTF.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入名称后保存" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
    }
     
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
