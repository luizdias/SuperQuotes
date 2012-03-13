//
//  EmployeeTableViewCell.h
//  Employees
//
//  Created by Keith Ermel on 2/12/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Employee;

@interface EmployeeTableViewCell : UITableViewCell

+(void)updateCell:(UITableViewCell *)cell withEmployee:(Employee *)employee;
+(UIImageView *)thumbnailImageView:(UITableViewCell *)cell;
+(UILabel *)nameLabel:(UITableViewCell *)cell;
+(UILabel *)titleLabel:(UITableViewCell *)cell;
+(UILabel *)affiliationLabel:(UITableViewCell *)cell;

@end
