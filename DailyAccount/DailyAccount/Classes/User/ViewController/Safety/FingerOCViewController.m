//
//  FingerOCViewController.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/7.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "FingerOCViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "DataManager.h"

@interface FingerOCViewController ()

@property (nonatomic, strong) UISwitch *ocSwitch;

@end

@implementation FingerOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, DAScreenWidth, 44)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UILabel *finger = [[UILabel alloc] initWithFrame:CGRectMake(12, 1, 200, 42)];
    finger.text = @"开启指纹解锁";
    [backView addSubview:finger];
    
    self.ocSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(DAScreenWidth - 63, 7, 51, 31)];
    [backView addSubview:self.ocSwitch];
    
    if ([[[DataManager sharedDataManager] selectAllDataFromTable] isEqualToString:@"1"])
    {
        [self.ocSwitch setOn:YES];
    }
    else
    {
        [[DataManager sharedDataManager] insertDataToTableWithstate:@"0"];
        [self.ocSwitch setOn:NO];
    }
    [self.ocSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    /*
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    documentPath = [documentPath stringByAppendingString:@"/safe.txt"];
    NSString *content = [NSString stringWithContentsOfFile:documentPath encoding:NSUTF8StringEncoding error:nil];
    if ([content isEqualToString:@"1"])
    {
        [self.ocSwitch setOn:YES];
    }
     */
    
    
}


- (void)switchAction:(UISwitch *)sender
{
    
    [[DataManager sharedDataManager] openDataBase];
    [[DataManager sharedDataManager] createSwitchTable];
    [self authenticateUser];
    
    
    
    
    
    /*
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    documentPath = [documentPath stringByAppendingString:@"/safe.txt"];
    NSError *error = nil;
    if ([self.ocSwitch isOn])
    {
        NSLog(@"开启");
        [self authenticateUser];
        
        NSString *content = @"1";
        [content writeToFile:documentPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (error == nil)
        {
            NSLog(@"成功");
        }
        else
        {
            NSLog(@"失败");
        }
    }
    else
    {
        NSLog(@"关闭");
        [self authenticateUser];
        
        NSString *content = @"0";
        [content writeToFile:documentPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (error == nil)
        {
            NSLog(@"成功");
        }
        else
        {
            NSLog(@"失败");
        }
    }
    NSString *content = [NSString stringWithContentsOfFile:documentPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",content);
     */
}

#pragma mark 指纹验证
- (void)authenticateUser
{
    
    
    
    //初始化上下文对象
    LAContext* context = [[LAContext alloc] init];
    //错误对象
    NSError* error = nil;
    NSString* result = @"通过Home键验证已有手机指纹";
    
    //首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //支持指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:result reply:^(BOOL success, NSError *error) {
            if (success) {
                //验证成功，主线程处理UI
                if ([self.ocSwitch isOn])
                {
                    NSLog(@"开关开启");
                    [[DataManager sharedDataManager] updataState:@"1"];
                    NSLog(@"更新为%@",[[DataManager sharedDataManager] selectAllDataFromTable]);
                }
                else
                {
                    NSLog(@"开关关闭");
                    [[DataManager sharedDataManager] updataState:@"0"];
                    NSLog(@"更新为%@",[[DataManager sharedDataManager] selectAllDataFromTable]);
                }
            }
            else
            {
                // 验证失败
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([self.ocSwitch isOn])
                    {
                        NSLog(@"!!!!!");
                        [self.ocSwitch setOn:NO];
                        NSLog(@"开关开启失败");
                        [[DataManager sharedDataManager] updataState:@"0"];
                        NSLog(@"更新为%@",[[DataManager sharedDataManager] selectAllDataFromTable]);
                    }
                    else
                    {
                        [self.ocSwitch setOn:YES];
                        NSLog(@"开关关闭失败");
                        [[DataManager sharedDataManager] updataState:@"1"];
                        NSLog(@"更新为%@",[[DataManager sharedDataManager] selectAllDataFromTable]);
                    }
                    
                    NSLog(@"%@",error.localizedDescription);
                    switch (error.code)
                    {
                        case LAErrorSystemCancel:
                        {
                            NSLog(@"Authentication was cancelled by the system");
                            //切换到其他APP，系统取消验证Touch ID
                            break;
                        }
                        case LAErrorUserCancel:
                        {
                            NSLog(@"Authentication was cancelled by the user");
                            //用户取消验证Touch ID
                            break;
                        }
                        case LAErrorUserFallback:
                        {
                            NSLog(@"User selected to enter custom password");
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                //用户选择输入密码，切换主线程处理
                            }];
                            break;
                        }
                        default:
                        {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                //其他情况，切换主线程处理
                            }];
                            break;
                        }
                    }
                });
            }
        }];
    }
    else
    {
        //不支持指纹识别，LOG出错误详情
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
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
