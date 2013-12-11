//
//  FakeQuestionBuilder.h
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "QuestionBuilder.h"

@interface FakeQuestionBuilder : QuestionBuilder

@property (copy) NSString * JSON;
@property (copy) NSArray * arrayToReturn;
@property (copy) NSError * errorToSet;

@end
