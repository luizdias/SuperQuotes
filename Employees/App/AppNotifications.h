//
//  AppNotifications.h
//  Employees
//
//  Created by Keith Ermel on 2/20/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppNotifications : NSObject


#pragma mark - Notification Names
extern NSString *const kEmployeesRetrieved;


#pragma mark - Notification Dictionary keys
extern NSString *const kEmployeeDataKey;


+(NSNotification *)postAppNotification:(NSString *)name sender:(id)sender userInfo:(NSDictionary *)userInfo;

@end
