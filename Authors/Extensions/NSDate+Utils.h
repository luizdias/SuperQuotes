//
//  NSDate+Utils.h
//  Spike017_Universal_SplitView
//
//  Created by Keith Ermel on 1/22/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

+(NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day;
+(NSNumber *)calculateNumberOfYearsSince:(NSDate *)date;
+(NSDateComponents *)components:(NSUInteger)unitFlags fromDate:(NSDate *)date toDate:(NSDate *)resultDate options:(NSUInteger)opts;

@end
