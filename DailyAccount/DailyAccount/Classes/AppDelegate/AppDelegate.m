//
//  AppDelegate.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <UMSocial.h>
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "DataManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [TabBarController new];
    
    // leanCloud
    [AVOSCloud setApplicationId:DAAVOSAppID
                      clientKey:DAAVOSAppKey];
    
    // Umeng
    [UMSocialData setAppKey:DAUmengAppKey];
    // UmengWechat
    [UMSocialWechatHandler setWXAppId:DAUmengWechatAppKey appSecret:DAUmengWechatAppSecret url:@"http://www.umeng.com/social"];
    // UmengQQ
    [UMSocialQQHandler setQQWithAppId:DAUmengQQAppID appKey:DAUmengQQAppKey url:@"http://www.umeng.com/social"];
    
    
    [[DataManager sharedDataManager] openDataBase];
    if ([[[DataManager sharedDataManager] selectAllDataFromTable] isEqualToString:@"1"])
    {
        [self authenticateUser];
        NSLog(@"更新为%@",[[DataManager sharedDataManager] selectAllDataFromTable]);
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        NSLog(@"分享失败");
    }
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    /*
    // 指纹解锁相关
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingString:@"/test1.txt"];
    
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSError *error = nil;
    NSLog(@"two%@",content);
    if ([content isEqualToString:@"1"])
    {
        NSLog(@"开启");
        [self authenticateUser];
        
        NSString *content = @"1";
        [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (error == nil)
        {
            NSLog(@"成功");
        }
        else
        {
            NSLog(@"失败");
        }
    }
    */
    
    
    
    
    
    
    // 手势解锁相关
    NSString* pswd = [LLLockPassword loadLockPassword];
    if (pswd) {
        [self showLLLockViewController:LLLockViewTypeCheck];
    }
//    else {
//        [self showLLLockViewController:LLLockViewTypeCreate];
//    }
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - 弹出手势解锁密码输入框
- (void)showLLLockViewController:(LLLockViewType)type
{
    if(self.window.rootViewController.presentingViewController == nil){
        
        NSLog(@"root = %@", self.window.rootViewController.class);
        NSLog(@"lockVc isBeingPresented = %d", [self.lockVc isBeingPresented]);
        
        self.lockVc = [[LLLockViewController alloc] init];
        self.lockVc.nLockViewType = type;
        
        self.lockVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self.window.rootViewController presentViewController:self.lockVc animated:NO completion:^{
        }];
        NSLog(@"创建了一个pop=%@", self.lockVc);
    }
}

#pragma mark 指纹解锁
- (void)authenticateUser
{
    //初始化上下文对象
    LAContext* context = [[LAContext alloc] init];
    //错误对象
    NSError* error = nil;
    NSString* result = @"Authentication is needed to access your notes.";
    
    //首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //支持指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:result reply:^(BOOL success, NSError *error) {
            if (success) {
                //验证成功，主线程处理UI
            }
            else
            {
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
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


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "CaiJin.DailyAccount" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DailyAccount" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DailyAccount.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
