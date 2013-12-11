//
//  MockStackOverflowCommunicator.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@interface MockStackOverflowCommunicator() {
    BOOL _wasAskedToFetchQuestions;
}

@end

@implementation MockStackOverflowCommunicator

-(void)searchForQuestionsWithTag:(NSString*)tag{
    _wasAskedToFetchQuestions = YES;
}

-(BOOL)wasAskedToFetchQuestions {
    return _wasAskedToFetchQuestions;
}

@end
