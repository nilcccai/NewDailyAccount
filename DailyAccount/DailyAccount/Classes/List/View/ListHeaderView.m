//
//  ListHeaderView.m
//  DailyAccount
//
//  Created by 魏永贺 on 16/3/9.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "ListHeaderView.h"

@implementation ListHeaderView

+(ListHeaderView *)listHeaderView
{
    ListHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"ListHeaderView" owner:self options:nil][0];
    return headerView;
}



@end
