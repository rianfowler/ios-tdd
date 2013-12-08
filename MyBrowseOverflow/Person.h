//
//  Person.h
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-08.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (readonly) NSString * name;
@property (readonly) NSURL * avatarLocation;

-(id)initWithName:(NSString*)newName avatarLocation:(NSString*)URL;

@end
