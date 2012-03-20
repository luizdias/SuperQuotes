//
//  PersonName.h
//  Spike018_Universal_Splitview
//
//  Created by Keith Ermel on 1/23/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonName : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic, strong) NSString *lastName;

+(PersonName *)personNameWithFirstName:(NSString *)first lastName:(NSString *)last;

-(NSString *)firstNameLastNameString;
-(NSString *)lastNameFirstNameString;
-(NSString *)fullNameString;

@end
