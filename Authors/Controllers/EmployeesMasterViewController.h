//
//  EmployeesMasterViewController.h
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmployeesDetailViewController;

@interface EmployeesMasterViewController : UITableViewController

@property (strong, nonatomic) EmployeesDetailViewController *detailViewController;

@end
