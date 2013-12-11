//
//  QuestionBuilder.h
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionBuilder : NSObject

-(NSArray*)questionsFromJSON:(NSString*)objectNotation error:(NSError**)error;

@end
