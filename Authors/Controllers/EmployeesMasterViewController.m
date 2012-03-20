//
//  EmployeesMasterViewController.m
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "EmployeesMasterViewController.h"
#import "EmployeesDetailViewController.h"
#import "EmployeeRetrievalServiceJSON.h"
#import "AppNotifications.h"
#import "Employee.h"
#import "EmployeeData.h"
#import "EmployeeTableViewCell.h"
#import "EmployeesAppDelegate.h"
#import "NSArray+Utils.h"


NSString *const cellIdentifier = @"Employee Cell";


@interface EmployeesMasterViewController()

@property (nonatomic, strong) NSArray *employees;

-(void)registerNotifications;
-(void)unregisterNotifications;

-(void)handleRowWasSelected:(NSIndexPath *)indexPath;

@end


@implementation EmployeesMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize employees = _employees;

-(void)displayEmployee:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSUInteger numEmployees = self.employees.count;

    if (numEmployees > 0) {
        Employee *employee = [self.employees objectAtIndex:indexPath.row];
        [EmployeeTableViewCell updateCell:cell withEmployee:employee];
    }
}

-(UITableViewCell *)obtainCell:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath numRows:(NSUInteger)numRows
{
    NSString *cellId = cellIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
    if (self.employees.count > 1) {
        Employee *employee = [self.employees objectAtIndex:indexPath.row];
        [EmployeeTableViewCell updateCell:cell withEmployee:employee];
    }
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSUInteger numRows = self.employees.count;
    UITableViewCell *cell = [self obtainCell:tableView forRowAtIndexPath:indexPath numRows:numRows];
    [self displayEmployee:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRows = self.employees.count;
    if (numRows < 1)
        numRows = 1;
    
    return numRows;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    [self handleRowWasSelected:indexPath];
}

-(void)handleRowWasSelected:(NSIndexPath *)indexPath
{
    Employee *employee = [self.employees objectAtIndex:indexPath.row];
    [self.detailViewController setDetailItem:employee];
}


#pragma mark - Notifications

-(void)employeesRetrieved:(NSNotification *)notification
{
    EmployeeData *employeeData = [notification.userInfo objectForKey:kEmployeeDataKey];
    self.employees = [NSArray reverse:employeeData.employees];
}

-(void)registerNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(employeesRetrieved:) name:kEmployeesRetrieved object:nil];
}

-(void)unregisterNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.detailViewController = segue.destinationViewController;
}


#pragma mark - Nib Awakening + Memory Warning

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    
    [self registerNotifications];
    
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.detailViewController = (EmployeesDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        [self handleRowWasSelected:indexPath];
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
