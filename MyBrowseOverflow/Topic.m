//
//  Topic.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "Topic.h"

@implementation Topic

-(id)initWithName:(NSString*)newName tag:(NSString*)newTag  {
    if ((self = [super init])) {
        _name = [newName copy];
        _tag = [newTag copy];
    }
    
    return self;
}

-(NSArray*)recentQuestions {
    return [NSArray array];
}

@end
