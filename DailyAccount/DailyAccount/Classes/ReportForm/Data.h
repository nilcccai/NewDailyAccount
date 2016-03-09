//
//  Data.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

//单例方法
+(Data *) sharedHandel;


///当前列表界面的标题
@property(nonatomic,strong)NSString *listTitle;

@end
