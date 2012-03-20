//
//  NSString+Utils.m
//  Gists
//
//  Created by Keith Ermel on 2/5/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

+(BOOL)isBlank:(NSString *)string
{
    if (string == nil) return YES;
    if (! [string isKindOfClass:[NSString class]]) return YES;
    return [string length] <= 0;
}

+(BOOL)isNotBlank:(NSString *)string
{
    if (string == nil) return NO;
    if (! [string isKindOfClass:[NSString class]]) return NO;
    return [string length] > 0;
}

+(NSString *)pointToString:(CGPoint)point
{
    return [NSString stringWithFormat:@"%3.2f, %3.2f", point.x, point.y];
}

+(NSString *)rectToString:(CGRect)rect
{
    return [NSString stringWithFormat:@"%3.2f, %3.2f, %3.2f, %3.2f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height];
}

+(NSString *)edgeInsetsToString:(UIEdgeInsets)edgeInsets
{
    return [NSString stringWithFormat:@"%3.2f, %3.2f, %3.2f, %3.2f", edgeInsets.top, edgeInsets.left, edgeInsets.bottom, edgeInsets.right];
}

@end
