//
//  NSArray+Utils.m
//  Employees
//
//  Created by Keith Ermel on 2/25/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "NSArray+Utils.h"


@implementation NSArray (Utils)


+(NSArray *)reverse:(NSArray *)array
{
    NSMutableArray *reversedArray = [NSMutableArray arrayWithCapacity:array.count];
    NSEnumerator *reverseEnumerator = [array reverseObjectEnumerator];
    for (id item in reverseEnumerator) {
        [reversedArray addObject:item];
    }
    return reversedArray;
}

@end
