//
//  RotatedView.h
//  DailyAccount
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 caijin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
#import "RenderView.h"

@class RotatedView;
@protocol RotatedViewDelegate <NSObject>
@optional
- (void)selectedFinish:(RotatedView *)rotatedView index:(NSInteger)index percent:(float)per;
@end

@interface RotatedView : UIView<RenderViewDataSource,RenderViewtDelegate> {
    float               mZeroAngle;
    NSMutableArray     *mValueArray;
    NSMutableArray     *mColorArray;
    NSMutableArray     *mThetaArray;
    
    BOOL                isAnimating;
    BOOL                isTapStopped;
    BOOL                isAutoRotation;
    float               mAbsoluteTheta;
    float               mRelativeTheta;
    UITextView         *mInfoTextView;
    
    float               mDragSpeed;
    NSDate             *mDragBeforeDate;
    float               mDragBeforeTheta;
    NSTimer            *mDecelerateTimer;
}


@property(nonatomic, assign) id<RotatedViewDelegate> delegate;
@property (nonatomic)float fracValue;
@property (nonatomic)         float           mZeroAngle;
@property (nonatomic)         BOOL            isAutoRotation;
@property (nonatomic, retain) NSMutableArray *mValueArray;
@property (nonatomic, retain) NSMutableArray *mColorArray;
@property (nonatomic, retain) UITextView     *mInfoTextView;

- (void)startedAnimate;
- (void)reloadPie;
@end
