//
//  EmployeesAppDelegate.h
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmployeeData;

@interface EmployeesAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) EmployeeData *employeeData;

@end
