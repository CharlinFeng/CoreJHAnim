//
//  CoreJazzHandsVC+Anim.m
//  CoreJazzHandsVC
//
//  Created by 成林 on 15/8/29.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CoreJHAnim+Anim.h"
#import "IFTTTJazzHands.h"

@implementation CoreJHAnim (Anim)

/** 定制动画 */
-(void)animWithTarget:(id)target animType:(JHAnimType)animType keyValuesBlock:(NSDictionary *(^)())keyValuesBlock{
    
    //添加关键帧
    NSAssert(keyValuesBlock != nil, @"错误：block不能为空");
    if (animType == JHAnimTypeTextColor){NSAssert([target isKindOfClass:[UILabel class]], @"错误：JHAnimTypeTextColor只能用于UILabel中");}
    
    Class Cls = [self animationClasses][animType];
    
    IFTTTViewAnimation * animation = nil;
    
    if (animType == JHAnimTypeTextColor){
        animation = [Cls animationWithLabel:(UILabel *)target];
    }else if (animType == JHAnimTypeConstraintConstant){
        animation = [Cls animationWithSuperview:nil constraint:target];
    }else{
        animation = [Cls animationWithView: target];
    }
    
    [keyValuesBlock() enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {

        if ([animation isKindOfClass:[IFTTTAlphaAnimation class]]){
            
            [(IFTTTAlphaAnimation *)animation addKeyframeForTime:[key floatValue] alpha:[obj floatValue]];
        }else if ([animation isKindOfClass:[IFTTTRotationAnimation class]]){
            [(IFTTTRotationAnimation *)animation addKeyframeForTime:[key floatValue] rotation:[obj floatValue]];
        }else if ([animation isKindOfClass:[IFTTTBackgroundColorAnimation class]]){
            [(IFTTTBackgroundColorAnimation *)animation addKeyframeForTime:[key floatValue] color:obj];
        }else if ([animation isKindOfClass:[IFTTTCornerRadiusAnimation class]]){
            [(IFTTTCornerRadiusAnimation *)animation addKeyframeForTime:[key floatValue] cornerRadius:[obj floatValue]];
        }else if ([animation isKindOfClass:[IFTTTScaleAnimation class]]){
            [(IFTTTScaleAnimation *)animation addKeyframeForTime:[key floatValue] scale:[obj floatValue]];
        }else if ([animation isKindOfClass:[IFTTTTranslationAnimation class]]){
            [(IFTTTTranslationAnimation *)animation addKeyframeForTime:[key floatValue] translation:[obj CGPointValue]];
        }else if ([animation isKindOfClass:[IFTTTTextColorAnimation class]]){
            [(IFTTTTextColorAnimation *)animation addKeyframeForTime:[key floatValue] color:obj];
        }else if ([animation isKindOfClass:[IFTTTConstraintConstantAnimation class]]){
            [(IFTTTConstraintConstantAnimation *)animation addKeyframeForTime:[key floatValue] constant:[obj floatValue]];
        }
        
        
    }];
    
    [self.animator addAnimation:animation];
}

-(NSArray *)animationClasses{
    
    return @[
             [IFTTTAlphaAnimation class],
             [IFTTTRotationAnimation class],
             [IFTTTBackgroundColorAnimation class],
             [IFTTTCornerRadiusAnimation class],
             [IFTTTScaleAnimation class],
             [IFTTTTranslationAnimation class],
             [IFTTTTextColorAnimation class],
             [IFTTTConstraintConstantAnimation class],
            ];
}


@end
