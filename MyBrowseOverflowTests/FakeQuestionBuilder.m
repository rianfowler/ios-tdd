//
//  FakeQuestionBuilder.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "FakeQuestionBuilder.h"

@class Question;

@implementation FakeQuestionBuilder

-(NSArray*)questionsFromJSON:(NSString *)objectNotation error:(NSError *__autoreleasing *)error {
    self.JSON = objectNotation;
    if (_errorToSet) {
        *error = _errorToSet;
    }
    
    
    
    return _arrayToReturn;
}

@end
