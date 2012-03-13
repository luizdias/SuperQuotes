//
//  EmployeesDetailViewController.h
//  Employees
//
//  Created by Keith Ermel on 2/15/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeesDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *affiliationLabel;
@property (weak, nonatomic) IBOutlet UILabel *speciesLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeworldLabel;
@property (weak, nonatomic) IBOutlet UILabel *vehicleLabel;
@property (weak, nonatomic) IBOutlet UILabel *weaponLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@property (weak, nonatomic) IBOutlet UILabel *affiliationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *speciesNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeworldNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *vehicleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *weaponNameLabel;
@property (weak, nonatomic) IBOutlet UIView *infoView;

@end
