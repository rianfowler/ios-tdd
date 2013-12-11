//
//  Question.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "Question.h"

@interface Question() {
    NSMutableSet * _answerSet;
}

@end

@implementation Question

-(instancetype)init {
    if (self = [super init]) {
        _answerSet = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void)addAnswer:(Answer *)answer {
    [_answerSet addObject:answer];
}

-(NSArray*)answers {
    return [[_answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}


@end
