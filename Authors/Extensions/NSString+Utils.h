//
//  NSString+Utils.h
//  Gists
//
//  Created by Keith Ermel on 2/5/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

+(BOOL)isBlank:(NSString *)string;
+(BOOL)isNotBlank:(NSString *)string;

+(NSString *)pointToString:(CGPoint)point;
+(NSString *)rectToString:(CGRect)rect;
+(NSString *)edgeInsetsToString:(UIEdgeInsets)edgeInsets;

@end
