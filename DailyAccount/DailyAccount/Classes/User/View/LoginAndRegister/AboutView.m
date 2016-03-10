//
//  AboutView.m
//  DailyAccount
//
//  Created by lanou3g on 16/3/10.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.appLogo = [[UIImageView alloc] initWithFrame:CGRectMake(DAScreenWidth / 3, DAScreenHeight / 4, DAScreenWidth / 3, DAScreenWidth / 3)];
    self.appLogo.image = [UIImage imageNamed:@"appLogo"];
    self.appLogo.layer.cornerRadius = 10;
    [self addSubview:self.appLogo];
    
    self.appName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.appLogo.frame), CGRectGetMaxY(self.appLogo.frame) + 30, self.appLogo.frame.size.width, 25)];
    self.appName.textAlignment = NSTextAlignmentCenter;
    self.appName.text = @"每天记";
    self.appName.textColor = DABlueColor;
    [self addSubview:self.appName];
    
    self.appEdition = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.appName.frame), CGRectGetMaxY(self.appName.frame) + DAScreenHeight / 4, self.appName.frame.size.width, 25)];
    self.appEdition.text = @"V 1.0";
    self.appEdition.textAlignment = NSTextAlignmentCenter;
    self.appEdition.textColor = [UIColor darkGrayColor];
    [self addSubview:self.appEdition];
}

@end
