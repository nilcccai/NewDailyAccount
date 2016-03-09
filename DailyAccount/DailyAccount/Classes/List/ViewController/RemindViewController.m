//
//  RemindViewController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/4.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "RemindViewController.h"
#import "AddController.h"
@interface RemindViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *tishiLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RemindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavtion];
    self.tishiLabel.backgroundColor = DABlueColor;
    self.tishiLabel.layer.masksToBounds = YES;
    self.tishiLabel.layer.cornerRadius = 20;
    self.textField.delegate = self;
    self.tishiLabel.hidden = YES;
}

#pragma mark 设置导航栏
-(void)setUpNavtion
{
    self.navigationItem.title = @"提醒名称";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction)];
}
#pragma mark 导航栏右按钮点击事件
-(void)rightBarButtonItemAction
{
    if (self.textField.text.length == 0) {
        [UIView animateWithDuration:2 animations:^{
            self.tishiLabel.hidden = NO;
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.tishiLabel.hidden = YES;
            });
        }];
    }else{
//        代理传值
        NSString *str = self.textField.text;
        if ([self.delegate respondsToSelector:@selector(sendMessageToFirstWith:)]) {
            [self.delegate sendMessageToFirstWith:str];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }

}

#pragma mark 回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.textField.text.length == 0) {
        [UIView animateWithDuration:2 animations:^{
            self.tishiLabel.hidden = NO;
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.tishiLabel.hidden = YES;
            });
        }];
    }

    return YES;
}

#pragma mark 点击空白回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.textField resignFirstResponder];
}
@end
