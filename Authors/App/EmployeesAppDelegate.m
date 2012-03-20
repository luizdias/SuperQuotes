//
//  EmployeesAppDelegate.m
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "EmployeesAppDelegate.h"
#import "EmployeeRetrievalServiceJSON.h"
#import "EmployeeData.h"
#import "AppNotifications.h"


@interface EmployeesAppDelegate() {
    id<EmployeeRetrievalService> employeeRetrievalService;
}

-(void)retrieveEmployees;
@end


@implementation EmployeesAppDelegate

@synthesize window = _window;
@synthesize employeeData = _employeeData;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
    [self retrieveEmployees];
    
    return YES;
}


#pragma mark - Employee Retrieval

-(void)configureEmployeeData:(id)employees
{
    self.employeeData = [[EmployeeData alloc] init];
    [self.employeeData fillFromArray:employees];
}

-(void)notifyEmployeesRetrieved
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:self.employeeData forKey:kEmployeeDataKey];
    [AppNotifications postAppNotification:kEmployeesRetrieved sender:self userInfo:userInfo];
}

-(void)retrieveEmployees
{
    employeeRetrievalService = [[EmployeeRetrievalServiceJSON alloc] initWithFilename:@"employees.json"];
    
    [employeeRetrievalService retrieveEmployees:^(id employees) {
        [self configureEmployeeData:employees];
        [self notifyEmployeesRetrieved];
        
    } failure:^(NSError *error) {
        NSLog(@"failure");
    }];
}


#pragma mark - App Lifecycle

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    NSLog(@"applicationWillTerminate");
}

@end
