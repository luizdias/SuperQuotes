//
//  UIColor+Utils.m
//  CodeswimmerUtils
//
//  Created by Keith Ermel on 2/1/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "UIColor+Utils.h"

CGFloat kColorMask = 255.0;

@implementation UIColor(Utils)

+(UIColor *)createWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha
{
    return [[UIColor alloc] initWithRed:red / kColorMask 
                                  green:green / kColorMask 
                                   blue:blue / kColorMask 
                                  alpha:alpha];
}

@end
