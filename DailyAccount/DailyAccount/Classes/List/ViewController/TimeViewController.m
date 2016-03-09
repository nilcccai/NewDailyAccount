//
//  TimeViewController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark  完成按钮点击事件
- (IBAction)finishItem:(UIBarButtonItem *)sender {
    // 获取用户通过UIDatePicker设置的日期和时间
    NSDate *selected = [self.dataPicker date];
    // 创建一个日期格式器
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 为日期格式器设置格式字符串
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:selected];
    NSString *message =  [NSString stringWithFormat:@"%@",destDateString];
    DALog(@"%@",message);
    if ([self.delegate respondsToSelector:@selector(sendMessageToTimeWith:)]) {
        [self.delegate sendMessageToTimeWith:message];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)quxiaoItem:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
