//
//  Person.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-08.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)newName avatarLocation:(NSString *)URL {
    self = [super init];
    _name = [newName copy];
    _avatarLocation = [NSURL URLWithString:URL];
    
    return self;
}

@end
