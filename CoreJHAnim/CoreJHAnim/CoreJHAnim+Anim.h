//
//  CoreJazzHandsVC+Anim.h
//  CoreJazzHandsVC
//
//  Created by 成林 on 15/8/29.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CoreJHAnim.h"

@interface CoreJHAnim (Anim)

/** 定制动画 */
-(void)animWithTarget:(id)target animType:(JHAnimType)animType keyValuesBlock:(NSDictionary *(^)())keyValuesBlock;


@end
