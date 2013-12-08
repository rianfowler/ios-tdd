//
//  Topic.h
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject
@property (readonly) NSString * name;
@property (readonly) NSString * tag;

-(id)initWithName:(NSString*)newName tag:(NSString*)newTag;
-(NSArray*)recentQuestions;

@end
