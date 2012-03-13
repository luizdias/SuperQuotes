//
//  NSDictionary+Utils.h
//  Spike019_Gists
//
//  Created by Keith Ermel on 1/28/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary(Utils)

+(void)logAllKeys:(NSDictionary *)dictionary
{
    NSArray *allKeys = [dictionary allKeys];
    
    NSUInteger numKeys = [allKeys count];
    NSLog(@"numKeys: %d", numKeys);
    
    for (NSString *key in allKeys) {
        id value = [dictionary valueForKey:key];
        NSString *valueString = @"";
        
        if ([value isKindOfClass:[NSString class]])
            valueString = (NSString *)value;
        else if ([value isKindOfClass:[NSNumber class]])
            valueString = [(NSNumber *)value stringValue];
        else if ([value isKindOfClass:[NSDictionary class]]) {
            NSLog(@"    %@ is a NSDictionary", key);
            [NSDictionary logAllKeys:(NSDictionary*)value];
        } 
        else if ([value isKindOfClass:[NSURL class]]) {
            valueString = [(NSURL *)value absoluteString];
        }
        else
            valueString = @"unknown";
        
        NSLog(@"    %@: %@", key, valueString);
    }
}

@end