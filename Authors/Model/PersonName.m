//
//  PersonName.m
//  Spike018_Universal_Splitview
//
//  Created by Keith Ermel on 1/23/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import "PersonName.h"

@implementation PersonName

@synthesize firstName = _firstName;
@synthesize middleName = _middleName;
@synthesize lastName = _lastName;


- (id)init {
    self = [super init];
    if (self) {
        self.firstName = @"";
        self.middleName = @"";
        self.lastName = @"";
    }
    return self;
}

+(PersonName *)personNameWithFirstName:(NSString *)first lastName:(NSString *)last
{
    PersonName *personName = [[PersonName alloc] init];
    personName.firstName = first;
    personName.lastName = last;
    return personName;
}

-(NSString *)firstNameLastNameString
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

-(NSString *)lastNameFirstNameString
{
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

-(NSString *)fullNameString
{
    return [NSString stringWithFormat:@"%@ %@ %@", self.firstName, self.middleName, self.lastName];
}

-(NSString *)debugDescription
{
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p>\n", NSStringFromClass([self class]), self];
    descriptionString = [descriptionString stringByAppendingFormat:@"     firstName: %@", self.firstName];
    descriptionString = [descriptionString stringByAppendingFormat:@"    middleName: %@", self.middleName];
    descriptionString = [descriptionString stringByAppendingFormat:@"      lastName: %@", self.lastName];
    return descriptionString;
}

-(NSString *)description
{
    return [self firstNameLastNameString];
}

@end
