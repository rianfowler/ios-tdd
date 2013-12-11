//
//  StackOverflowManager.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import "StackOverflowManager.h"

NSString * StackOverflowManagerError = @"StackOverflowMangerError";
NSString * StackOverflowManagerSearchFailedError = @"StackOverflowManagerSearchFailedError";

@implementation StackOverflowManager

-(void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate {
    if (newDelegate && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]){
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does no conform to the delegate protocol" userInfo:nil] raise];
    }
    _delegate = newDelegate;
}

-(void)fetchQuestionsOnTopic:(Topic*)topic {
    [_communicator searchForQuestionsWithTag:[topic tag]];
}

-(void)searchingForQuestionsFailedWithError:(NSError *)error {
    NSDictionary * errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    [self tellDelegateAboutQuestionSearchError:errorInfo];
}

-(void)receivedQuestionsJSON:(NSString *)objectNotation {
    NSError * error = nil;
    NSArray * questions = [_questionBuilder questionsFromJSON:objectNotation error:&error];
    if (!questions) {
        NSDictionary * errorInfo = nil;
        if (error) {
            errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
        }
        [self tellDelegateAboutQuestionSearchError:errorInfo];
    } else {
        [_delegate didReceiveQuestions:questions];
    }
}

-(void)tellDelegateAboutQuestionSearchError:(NSDictionary*)errorInfo {
    NSError * reportableError = [NSError errorWithDomain:StackOverflowManagerSearchFailedError code:StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
    
    [_delegate fetchingQuestionsFailedWithError:reportableError];
}



@end
