//
//  ExpireViewController.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ExpireViewController.h"

@interface ExpireViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *finishItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *quxiaoItem;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbarview;
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPickerView;
@end

@implementation ExpireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (IBAction)quxiaoAction:(UIBarButtonItem *)sender {
    
   [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)finishAction:(UIBarButtonItem *)sender {
    
    // 获取用户通过UIDatePicker设置的日期和时间
    NSDate *selected = [self.dataPickerView date];
    // 创建一个日期格式器
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 为日期格式器设置格式字符串
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    // 使用日期格式器格式化日期、时间
    NSString *destDateString = [dateFormatter stringFromDate:selected];
    NSString *message =  [NSString stringWithFormat:
                          @"%@", destDateString];
    if ([self.delegate respondsToSelector:@selector(sendMessageToExpireWith:)]) {
        [self.delegate sendMessageToExpireWith:message];
    }
        [self dismissViewControllerAnimated:YES completion:nil];
}

@end
