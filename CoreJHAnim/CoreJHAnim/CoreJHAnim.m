//
//  CoreJazzHandsVC.m
//  CoreJazzHandsVC
//
//  Created by 成林 on 15/8/29.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CoreJHAnim.h"


@interface CoreJHAnim ()<UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scrollView;



@end

@implementation CoreJHAnim

/** 初始化 */
+(instancetype)animWithScrollView:(UIScrollView *)scrollView{
    
    //创建
    CoreJHAnim *jhVC = [[CoreJHAnim alloc] init];
    
    //记录
    jhVC.scrollView = scrollView;
    
    scrollView.delegate = jhVC;
    
    return jhVC;
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.animator animate:scrollView.contentOffset.x];
}



-(IFTTTAnimator *)animator{
    
    if(_animator == nil){
        _animator = [[IFTTTAnimator alloc] init];
    }
    
    return _animator;
}


-(void)dealloc{
    
    self.animator = nil;
}



@end
