//
//  EmployeeTableViewCell.m
//  Employees
//
//  Created by Keith Ermel on 2/12/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "EmployeeTableViewCell.h"
#import "Employee.h"
#import "UIColor+Utils.h"
#import "UIImageView+WebCache.h"


@interface EmployeeTableViewCell()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) UIColor *highColor;
@property (nonatomic, strong) UIColor *lowColor;
@end


@implementation EmployeeTableViewCell

@synthesize gradientLayer = _gradientLayer;
@synthesize highColor = _highColor;
@synthesize lowColor = _lowColor;


-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.gradientLayer.bounds = self.bounds;
    self.gradientLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
}

-(void)awakeFromNib 
{
    self.gradientLayer = [[CAGradientLayer alloc] init];
    self.gradientLayer.bounds = self.bounds;
    self.gradientLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
    self.layer.cornerRadius = 5.0f;
}

#define kThumbnailTag           100
#define kNameLabelTag           200
#define kTitleLableTag          201
#define kAffiliationLabelTag    202

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    UIColor *borderColor;
    CGFloat borderWidth;
    UIColor *shadowColor;
    CGSize shadowOffset;
    
    if (self.selected) {
        self.highColor = [UIColor blackColor];
        self.lowColor = [UIColor createWithRed:0x33 green:0x33 blue:0x33 alpha:1.0];
        borderColor = [UIColor createWithRed:0x00 green:0x80 blue:0xFF alpha:1.0f];
        borderWidth = 2.0f;
        shadowColor = [UIColor createWithRed:0x74 green:0x40 blue:0x04 alpha:1.0];
        shadowOffset = CGSizeMake(1.0f, -1.0f);
    } else {
        self.highColor = [UIColor createWithRed:0xB3 green:0xB3 blue:0xB3 alpha:1.0];
        self.lowColor = [UIColor createWithRed:0x66 green:0x66 blue:0x66 alpha:1.0];
        borderColor = [UIColor whiteColor];
        borderWidth = 0.0f;
        shadowColor = [UIColor createWithRed:0xA0 green:0xA0 blue:0xA0 alpha:1.0f];
        shadowOffset = CGSizeMake(1.0f, 1.0f);
    }
    NSArray *colors = [[NSArray alloc] initWithObjects:(id)self.highColor.CGColor, (id)self.lowColor.CGColor, nil];
    [self.gradientLayer setColors:colors];
    
    UILabel *nameLabel = [EmployeeTableViewCell nameLabel:self];
    nameLabel.highlightedTextColor = [UIColor createWithRed:0xFC green:0x8B blue:0x08 alpha:1.0f];
    nameLabel.shadowColor = shadowColor;
    nameLabel.shadowOffset = shadowOffset;
    
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}


+(void)updateCell:(UITableViewCell *)cell withEmployee:(Employee *)employee
{
    UIImageView *thumbnailImageView = [EmployeeTableViewCell thumbnailImageView:cell];
    UILabel *nameLabel = [EmployeeTableViewCell nameLabel:cell];
    UILabel *titleLabel = [EmployeeTableViewCell titleLabel:cell];
    UILabel *affiliationLabel = [EmployeeTableViewCell affiliationLabel:cell];

    [thumbnailImageView setImageWithURL:[NSURL URLWithString:employee.thumbnailUrl] placeholderImage:[UIImage imageNamed:@"placeholder_32x32"]];
    titleLabel.text = employee.title;
    nameLabel.text = employee.name;
    affiliationLabel.text = employee.affiliation;
}

+(UIImageView *)thumbnailImageView:(UITableViewCell *)cell
{
    return (UIImageView *)[cell viewWithTag:kThumbnailTag];
}

+(UILabel *)nameLabel:(UITableViewCell *)cell
{
    return (UILabel *)[cell viewWithTag:kNameLabelTag];
}

+(UILabel *)titleLabel:(UITableViewCell *)cell
{
    return (UILabel *)[cell viewWithTag:kTitleLableTag];
}

+(UILabel *)affiliationLabel:(UITableViewCell *)cell
{
    return (UILabel *)[cell viewWithTag:kAffiliationLabelTag];
}

@end
