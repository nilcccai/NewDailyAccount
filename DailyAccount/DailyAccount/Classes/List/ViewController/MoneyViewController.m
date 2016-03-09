//
//  MoneyViewController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "MoneyViewController.h"

@interface MoneyViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFieldView;
@property (weak, nonatomic) IBOutlet UILabel *tishiLabel;

@end

@implementation MoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavtion];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tishiLabel.backgroundColor = DABlueColor;
    self.tishiLabel.layer.masksToBounds = YES;
    self.tishiLabel.layer.cornerRadius = 15;
    self.textFieldView.delegate = self;
    self.tishiLabel.hidden = YES;
}
#pragma mark 设置导航栏
-(void)setUpNavtion
{
    self.navigationItem.title = @"输入金额";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemAction)];
}

#pragma mark 导航栏返回按钮
-(void)leftBarButtonItemAction
{
    NSString *str = self.textFieldView.text;
    if ([self.delegate respondsToSelector:@selector(sendMessageToMoneytWith:)]) {
        [self.delegate sendMessageToMoneytWith:str];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 限制UITextField的输入字数
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (toBeString.length > 10 && range.length!=1){
        textField.text = [toBeString substringToIndex:10];
        return NO;
    }
    return YES;
}

#pragma mark 点击renturn回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.textFieldView.text.length == 0) {
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
    
    [self.textFieldView resignFirstResponder];
}
@end
