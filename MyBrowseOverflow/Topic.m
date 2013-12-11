//
//  Topic.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "Topic.h"

@interface Topic() {
    NSMutableArray * _questions;
}

@end

@implementation Topic

-(instancetype)initWithName:(NSString*)newName tag:(NSString*)newTag  {
    if ((self = [super init])) {
        _name = [newName copy];
        _tag = [newTag copy];
        _questions = [NSMutableArray array];
    }
    
    return self;
}

-(NSArray*)recentQuestions {
    return [self sortQuestionsLatestFirst:_questions];
}

-(void)addQuestion:(Question*)newQuestion {
    [_questions addObject:newQuestion];
    if ([_questions count] > 20) {
        _questions = [self sortQuestionsLatestFirst:_questions];
        _questions = [NSMutableArray arrayWithArray:[_questions subarrayWithRange:NSMakeRange(0, 20)]];
    }
    
}

-(NSMutableArray*)sortQuestionsLatestFirst:(NSMutableArray*)questionList {
    return [NSMutableArray arrayWithArray:[questionList sortedArrayUsingComparator:^(id obj1, id obj2) {
        Question * q1 = (Question*)obj1;
        Question * q2 = (Question*)obj2;
        return [q2.date compare: q1.date];
    }]];
}

@end
