//
//  EmployeesDetailViewController.m
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "EmployeesDetailViewController.h"
#import "Employee.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Utils.h"


@interface EmployeesDetailViewController () 

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

-(void)setupBorders;
-(void)configureView;
-(void)adjustDisplayForPortrait;
-(void)adjustDisplayForLandscape;

@end


@implementation EmployeesDetailViewController

@synthesize detailItem = _detailItem;
@synthesize photoImageView = _photoImageView;
@synthesize nameLabel = _nameLabel;
@synthesize titleLabel = _titleLabel;
@synthesize affiliationLabel = _affiliationLabel;
@synthesize speciesLabel = _speciesLabel;
@synthesize genderLabel = _genderLabel;
@synthesize heightLabel = _heightLabel;
@synthesize homeworldLabel = _homeworldLabel;
@synthesize vehicleLabel = _vehicleLabel;
@synthesize weaponLabel = _weaponLabel;
@synthesize biographyTextView = _biographyTextView;
@synthesize affiliationNameLabel = _affiliationNameLabel;
@synthesize speciesNameLabel = _speciesNameLabel;
@synthesize genderNameLabel = _genderNameLabel;
@synthesize heightNameLabel = _heightNameLabel;
@synthesize homeworldNameLabel = _homeworldNameLabel;
@synthesize vehicleNameLabel = _vehicleNameLabel;
@synthesize weaponNameLabel = _weaponNameLabel;
@synthesize infoView = _infoView;
@synthesize masterPopoverController = _masterPopoverController;


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    if (self.detailItem) {
        Employee *employee = (Employee *)self.detailItem;
        NSString *name = [employee name];
        self.title = name;
        [self.photoImageView setImageWithURL:[NSURL URLWithString:employee.photoUrl] placeholderImage:[UIImage imageNamed:@"starwrkrs_90x90"]];
        self.nameLabel.text = name;
        self.titleLabel.text = employee.title;
        self.affiliationLabel.text = employee.affiliation;
        self.speciesLabel.text = employee.species;
        self.genderLabel.text = employee.gender;
        self.heightLabel.text = employee.height;
        self.homeworldLabel.text = employee.homeworld;
        self.vehicleLabel.text = employee.vehicle;
        self.weaponLabel.text = employee.weapon;
        self.biographyTextView.text = employee.biography;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewDidLayoutSubviews
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
            [self adjustDisplayForLandscape];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupBorders];
    [self configureView];
}

- (void)viewDidUnload
{
    [self setPhotoImageView:nil];
    [self setNameLabel:nil];
    [self setTitleLabel:nil];
    [self setAffiliationLabel:nil];
    [self setSpeciesLabel:nil];
    [self setGenderLabel:nil];
    [self setHeightLabel:nil];
    [self setHomeworldLabel:nil];
    [self setVehicleLabel:nil];
    [self setWeaponLabel:nil];
    [self setBiographyTextView:nil];
    [self setAffiliationNameLabel:nil];
    [self setSpeciesNameLabel:nil];
    [self setGenderNameLabel:nil];
    [self setHeightNameLabel:nil];
    [self setHomeworldNameLabel:nil];
    [self setVehicleNameLabel:nil];
    [self setWeaponNameLabel:nil];

    [self setInfoView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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


#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void)setupBorders
{
    CGColorRef borderColor = [UIColor createWithRed:0x47 green:0x7A blue:0xB7 alpha:1.0].CGColor;
    CGFloat borderWidth = 1.0;
    CGFloat borderRadius = 10.0;
    self.biographyTextView.layer.borderColor = borderColor;
    self.biographyTextView.layer.borderWidth = borderWidth;
    self.biographyTextView.layer.cornerRadius = borderRadius;
    self.infoView.layer.borderColor = borderColor;
    self.infoView.layer.borderWidth = borderWidth;
    self.infoView.layer.cornerRadius = borderRadius;
}

-(void)adjustDisplayForPortrait
{
    self.photoImageView.frame           = CGRectMake( 20,  20, 113, 175);
    self.nameLabel.frame                = CGRectMake( 20, 196, 113,  21);
    self.titleLabel.frame               = CGRectMake( 20, 225, 113,  16);
    self.affiliationNameLabel.frame     = CGRectMake( 20, 256,  60,  14);
    self.affiliationLabel.frame         = CGRectMake( 88, 256, 212,  14);
    self.speciesNameLabel.frame         = CGRectMake( 20, 278,  60,  14);
    self.speciesLabel.frame             = CGRectMake( 88, 278, 212,  14);
    self.genderNameLabel.frame          = CGRectMake( 20, 300,  60,  14);
    self.genderLabel.frame              = CGRectMake( 88, 300, 212,  14);
    self.heightNameLabel.frame          = CGRectMake( 20, 322,  60,  14);
    self.heightLabel.frame              = CGRectMake( 88, 322, 212,  14);
    self.homeworldNameLabel.frame       = CGRectMake( 20, 344,  60,  14);
    self.homeworldLabel.frame           = CGRectMake( 88, 344, 212,  14);
    self.vehicleNameLabel.frame         = CGRectMake( 20, 366,  60,  14);
    self.vehicleLabel.frame             = CGRectMake( 88, 366, 212,  14);
    self.weaponNameLabel.frame          = CGRectMake( 20, 388,  60,  14);
    self.weaponLabel.frame              = CGRectMake( 88, 388, 212,  14);
    self.biographyTextView.frame        = CGRectMake(141,  20, 159, 228);
    self.infoView.frame                 = CGRectMake( 20, 256, 280, 146);
}

-(void)adjustDisplayForLandscape
{
    self.photoImageView.frame       = CGRectMake( 20,  20, 113, 175);
    self.nameLabel.frame            = CGRectMake( 20, 196, 113,  21);
    self.titleLabel.frame           = CGRectMake( 20, 225, 113,  16);
    self.affiliationNameLabel.frame = CGRectMake(141, 225,  60,  14);
    self.affiliationLabel.frame     = CGRectMake(209, 225, 251,  14);
    self.speciesNameLabel.frame     = CGRectMake(141, 140,  60,  14);
    self.speciesLabel.frame         = CGRectMake(209, 140,  85,  14);
    self.genderNameLabel.frame      = CGRectMake(307, 140,  60,  14);
    self.genderLabel.frame          = CGRectMake(375, 140,  85,  14);
    self.heightNameLabel.frame      = CGRectMake(141, 162,  60,  14);
    self.heightLabel.frame          = CGRectMake(209, 162,  85,  14);
    self.homeworldNameLabel.frame   = CGRectMake(307, 162,  60,  14);
    self.homeworldLabel.frame       = CGRectMake(375, 162,  85,  14);
    self.vehicleNameLabel.frame     = CGRectMake(141, 184,  60,  14);
    self.vehicleLabel.frame         = CGRectMake(209, 184, 251,  14);
    self.weaponNameLabel.frame      = CGRectMake(141, 206,  60,  14);
    self.weaponLabel.frame          = CGRectMake(209, 206, 251,  14);
    self.biographyTextView.frame    = CGRectMake(141,  20, 319, 112);
    self.infoView.frame             = CGRectMake(141, 138, 319, 103);
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (UIInterfaceOrientationIsPortrait(fromInterfaceOrientation))
            [self adjustDisplayForLandscape];
        else
            [self adjustDisplayForPortrait];
    }
}


#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"StarWrkrs", @"StarWrkrs");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
