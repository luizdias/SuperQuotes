//
//  EmployeeData.h
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeData : NSObject

@property (copy) NSArray *employees;

-(void)fillFromArray:(NSArray *)array;
-(NSArray *)employeesSortedByName;

@end
