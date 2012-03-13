//
//  EmployeeData.m
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "EmployeeData.h"
#import "Employee.h"

@implementation EmployeeData

@synthesize employees = _employees;

-(void)fillFromArray:(NSArray *)array
{
    NSMutableArray *theEmployees = [[NSMutableArray alloc] init];
    
    if ([array isKindOfClass:[NSArray class]]) {
        NSLog(@"success: %d", ((NSArray*)array).count);
        
        for (id item in array) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                Employee *employee = [[Employee alloc] initWithDictionary:(NSDictionary *)item];
                [theEmployees addObject:employee];
            }
        }
    }
    
    self.employees = theEmployees;
}

-(NSArray *)employeesSortedByName
{
    if (self.employees == nil || self.employees.count <= 1)
        return self.employees;
    
    NSArray *sortedArray = [self.employees sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *obj1_name = ((Employee *)obj1).name;
        NSString *obj2_name = ((Employee *)obj2).name;
        return [obj1_name compare:obj2_name];
    }];
    
    return sortedArray;
}
@end
