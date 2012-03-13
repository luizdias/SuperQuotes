//
//  AppNotifications.m
//  Employees
//
//  Created by Keith Ermel on 2/20/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "AppNotifications.h"

@implementation AppNotifications


#pragma mark - Notification Names
NSString *const kEmployeesRetrieved             = @"Employees Retrieved";               /* userInfo: kEmployeesArrayKey = EmployeeData* */

#pragma mark - Notification Keys
NSString *const kEmployeeDataKey                = @"Employee Data Key";


+(NSNotification *)postAppNotification:(NSString *)name sender:(id)sender userInfo:(NSDictionary *)userInfo
{
    NSNotification *notification = [NSNotification notificationWithName:name object:sender userInfo:userInfo];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    return notification;    
}

@end
