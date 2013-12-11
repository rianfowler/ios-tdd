//
//  MOckStackOverflowManagerDelegate.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@implementation MockStackOverflowManagerDelegate

-(void)fetchingQuestionsFailedWithError:(NSError *)error {
    self.fetchError = error;
    
}

-(void)didReceiveQuestions:(NSArray *)questions {
    _receivedQuestions = [questions copy];
}


@end
