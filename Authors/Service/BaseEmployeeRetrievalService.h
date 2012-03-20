//
//  BaseEmployeeRetrievalService.h
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^success_block)(id employees);
typedef void (^failure_block)(NSError *error);

@protocol EmployeeRetrievalService <NSObject>
@required
-(void)retrieveEmployees:(success_block)successBlock failure:(failure_block)failureBlock;
@end

@interface BaseEmployeeRetrievalService : NSObject <EmployeeRetrievalService>

@end
