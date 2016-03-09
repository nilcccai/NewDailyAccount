//
//  Data.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "Data.h"

static Data *handel = nil;
@implementation Data

//单例方法
+ (Data *) sharedHandel{
    
    @synchronized(self){
        
        if (handel == nil) {
            
            handel = [[Data alloc] init];
            
        }
    }
    return handel;
}





@end
