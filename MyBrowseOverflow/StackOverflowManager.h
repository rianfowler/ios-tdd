//
//  StackOverflowManager.h
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicator.h"
#import "Topic.h"
#import "QuestionBuilder.h"

@protocol StackOverflowManagerDelegate <NSObject>
-(void)fetchingQuestionsFailedWithError: (NSError*)error;
-(void)didReceiveQuestions:(NSArray*)questions;
@end

@interface StackOverflowManager : NSObject

@property (weak, nonatomic) id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator * communicator;

@property (strong) QuestionBuilder * questionBuilder;

extern NSString * StackOverflowManagerError;
extern NSString * StackOverflowManagerSearchFailedError;
enum {
    StackOverflowManagerErrorQuestionSearchCode
};

-(void)fetchQuestionsOnTopic:(Topic*)topic;
-(void)searchingForQuestionsFailedWithError:(NSError*)error;
-(void)receivedQuestionsJSON:(NSString*)objectNotation;

@end
