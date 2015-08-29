//
//  CoreJazzHandsVC.h
//  CoreJazzHandsVC
//
//  Created by 成林 on 15/8/29.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTTTJazzHands.h"
#import "JHAnimType.h"


@interface CoreJHAnim : UIViewController

@property (nonatomic,strong) IFTTTAnimator *animator;

/** 初始化 */
+(instancetype)animWithScrollView:(UIScrollView *)scrollView;





@end
