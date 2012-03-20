//
//  Employee.h
//  Employees
//
//  Created by Keith Ermel on 2/16/12.
//  Copyright (c) 2012 codeswimmer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *affiliation;

@property (nonatomic, strong) NSString *species;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *height;

@property (nonatomic, strong) NSString *homeworld;
@property (nonatomic, strong) NSString *vehicle;
@property (nonatomic, strong) NSString *weapon;
@property (nonatomic, strong) NSString *biography;

@property (nonatomic, strong) NSString *thumbnailUrl;
@property (nonatomic, strong) NSString *photoUrl;

@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic, strong) NSDate *hireDate;
@property (readonly, nonatomic, strong) NSNumber *numberOfYearsEmployed;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
