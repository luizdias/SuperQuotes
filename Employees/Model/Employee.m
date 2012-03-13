//
//  Employee.m
//  Employees
//
//  Created by Keith Ermel on 2/16/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "Employee.h"
#import "NSString+Utils.h"

@implementation Employee

@synthesize name = _name;
@synthesize title = _title;
@synthesize affiliation = _affiliation;
@synthesize species = _species;
@synthesize gender = _gender;
@synthesize height = _height;
@synthesize homeworld = _homeworld;
@synthesize vehicle = _vehicle;
@synthesize weapon = _weapon;
@synthesize biography = _biography;
@synthesize thumbnailUrl = _thumbnailUrl;
@synthesize photoUrl = _photoUrl;
@synthesize dateOfBirth = _dateOfBirth;
@synthesize hireDate = _hireDate;
@synthesize numberOfYearsEmployed = _numberOfYearsEmployed;


NSString *const kNameKey			 = @"name";
NSString *const kTitleKey            = @"title";
NSString *const kAffiliationKey      = @"affiliation";
NSString *const kSpeciesKey          = @"species";
NSString *const kGenderKey           = @"gender";
NSString *const kHeightKey           = @"height";
NSString *const kHomeworldKey        = @"homeworld";
NSString *const kVehicleKey          = @"vehicle";
NSString *const kWeaponKey           = @"weapon";
NSString *const kBiographyKey        = @"biography";
NSString *const kThumbnailUrlKey     = @"thumbnailUrl";
NSString *const kPhotoUrlKey         = @"photoUrl";


-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if (self) {
        NSString *value = [dictionary valueForKey:kNameKey];
        if ([NSString isNotBlank:value]) self.name = value;
        
        value = [dictionary valueForKey:kTitleKey];
        if ([NSString isNotBlank:value]) self.title = value;
        
        value = [dictionary valueForKey:kAffiliationKey];
        if ([NSString isNotBlank:value]) self.affiliation = value;
        
        value = [dictionary valueForKey:kSpeciesKey];
        if ([NSString isNotBlank:value]) self.species = value;
        
        value = [dictionary valueForKey:kGenderKey];
        if ([NSString isNotBlank:value]) self.gender = value;
        
        value = [dictionary valueForKey:kHeightKey];
        if ([NSString isNotBlank:value]) self.height = value;
        
        value = [dictionary valueForKey:kHomeworldKey];
        if ([NSString isNotBlank:value]) self.homeworld = value;
        
        value = [dictionary valueForKey:kVehicleKey];
        if ([NSString isNotBlank:value]) self.vehicle = value;
        
        value = [dictionary valueForKey:kWeaponKey];
        if ([NSString isNotBlank:value]) self.weapon = value;
        
        value = [dictionary valueForKey:kBiographyKey];
        if ([NSString isNotBlank:value]) self.biography = value;
        
        value = [dictionary valueForKey:kThumbnailUrlKey];
        if ([NSString isNotBlank:value]) self.thumbnailUrl = value;

        value = [dictionary valueForKey:kPhotoUrlKey];
        if ([NSString isNotBlank:value]) self.photoUrl = value;
        
    }
    NSLog(@"initWithDictionary: %@", [self debugDescription]);
    return self;
}

-(NSString *)debugDescription
{
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p>\n", NSStringFromClass([self class]), self];
    
    descriptionString = [descriptionString stringByAppendingFormat:@"            name: %@\n", self.name];
    descriptionString = [descriptionString stringByAppendingFormat:@"     affiliation: %@\n", self.affiliation];
    descriptionString = [descriptionString stringByAppendingFormat:@"         species: %@\n", self.species];
    descriptionString = [descriptionString stringByAppendingFormat:@"          gender: %@\n", self.gender];
    descriptionString = [descriptionString stringByAppendingFormat:@"          height: %@\n", self.height];
    descriptionString = [descriptionString stringByAppendingFormat:@"       homeworld: %@\n", self.homeworld];
    descriptionString = [descriptionString stringByAppendingFormat:@"         vehicle: %@\n", self.vehicle];
    descriptionString = [descriptionString stringByAppendingFormat:@"          weapon: %@\n", self.weapon];
    descriptionString = [descriptionString stringByAppendingFormat:@"       biography: %@\n", self.biography];
    descriptionString = [descriptionString stringByAppendingFormat:@"    thumbnailUrl: %@\n", self.thumbnailUrl];
    descriptionString = [descriptionString stringByAppendingFormat:@"        photoUrl: %@\n", self.photoUrl];
    
    NSString *dobString = [NSDateFormatter localizedStringFromDate:self.dateOfBirth dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
    NSString *hireDateString = [NSDateFormatter localizedStringFromDate:self.hireDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
    descriptionString = [descriptionString stringByAppendingFormat:@"       birthDate: %@\n", dobString];
    descriptionString = [descriptionString stringByAppendingFormat:@"        hireDate: %@\n", hireDateString];
    descriptionString = [descriptionString stringByAppendingFormat:@"numYearsEmployed: %@\n", self.numberOfYearsEmployed];
    return descriptionString;
}

-(NSString *)description
{
    return self.name;
}
@end
