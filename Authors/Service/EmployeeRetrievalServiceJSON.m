//
//  EmployeeRetrievalServiceJSON.m
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "EmployeeRetrievalServiceJSON.h"

@interface EmployeeRetrievalServiceJSON() {
    NSString *jsonFilename;
}
@end

@implementation EmployeeRetrievalServiceJSON

-(id)initWithFilename:(NSString *)filename
{
    self = [self init];
    if (self) {
        jsonFilename = filename;
    }
    return self;
}

-(void)retrieveEmployees:(success_block)successBlock failure:(failure_block)failureBlock
{
    NSLog(@"EmployeeRetrievalServiceJSON:retrieveEmployees: %@", jsonFilename);
    NSString *filePath = [[NSBundle mainBundle] pathForResource:jsonFilename ofType:nil];
    NSError *error = [[NSError alloc] init];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *employeesJson = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    successBlock(employeesJson);
}

@end
