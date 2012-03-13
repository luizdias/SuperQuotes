//
//  NSDate+Utils.m
//  Spike017_Universal_SplitView
//
//  Created by Keith Ermel on 1/22/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "NSDate+Utils.h"

@interface NSDate()
@end


@implementation NSDate (Utils)

+(NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:components];
    
    return date;
}

+(NSNumber *)calculateNumberOfYearsSince:(NSDate *)fromDate
{
    NSDate *now = [[NSDate alloc] init];
    NSUInteger unitFlags = NSYearCalendarUnit;
    NSDateComponents *components = [NSDate components:unitFlags fromDate:fromDate toDate:now options:0];
    NSInteger years = [components year];
    return [NSNumber numberWithDouble:years];
}

+(NSDateComponents *)components:(NSUInteger)unitFlags fromDate:(NSDate *)date toDate:(NSDate *)resultDate options:(NSUInteger)opts
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:unitFlags fromDate:date toDate:resultDate options:opts];
    return components;
}

@end
