//
//  QuestionCreationTests.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-11.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StackOverflowManager.h"
#import "Topic.h"
#import "MockStackOverflowCommunicator.h"
#import "MockStackOverflowManagerDelegate.h"
#import "FakeQuestionBuilder.h"

@interface QuestionCreationTests : XCTestCase {
@private
    StackOverflowManager * manager;
    MockStackOverflowManagerDelegate * delegate;
    NSError * underlyingError;
    FakeQuestionBuilder * builder;
    NSArray * questionArray;
}

@end

@implementation QuestionCreationTests

- (void)setUp
{
    [super setUp];
     manager = [[StackOverflowManager alloc] init];
    delegate = [[MockStackOverflowManagerDelegate alloc] init];
    manager.delegate = delegate;
    underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    builder = [[FakeQuestionBuilder alloc] init];
    manager.questionBuilder = builder;
    
    Question * question = [[Question alloc] init];
    questionArray = [NSArray arrayWithObject:question];

    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    manager = nil;
    delegate = nil;
    underlyingError = nil;
    questionArray = nil;
    [super tearDown];
}

-(void)testNonConformingObjectCannotBeDelegate {
    XCTAssertThrows(manager.delegate = (id <StackOverflowManagerDelegate>)[NSNull null], @"NSNull should not be used as the delegate as it doesn't conform to the delegate protocol");
}

-(void)testManagerAcceptsNilAsADelegate {
    XCTAssertNoThrow(manager.delegate = nil, @"It should be accetapble to use nil as an object's delegate");
}

-(void)testAskingForQuestionsMeansRequestingData {
    MockStackOverflowCommunicator * communicator = [[MockStackOverflowCommunicator alloc] init];
    manager.communicator = communicator;
    
    Topic * topic = [[Topic alloc] initWithName: @"iPhone" tag:@"iphone"];
    [manager fetchQuestionsOnTopic: topic];
    XCTAssertTrue([communicator wasAskedToFetchQuestions], @"The commnicator should need to fetch data.");
    
}

-(void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommmunicator {
  //  MockStackOverflowManagerDelegate * delegate =
 //   [[MockStackOverflowManagerDelegate alloc] init];
    manager.delegate = delegate;
  //  NSError *underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo: nil];
    [manager searchingForQuestionsFailedWithError: underlyingError];
    XCTAssertFalse(underlyingError == [delegate fetchError], @"Error should be at the correct level of abstraction");
}

-(void)testErrorReturnedToDelegateDocumentsUnderlyingError {
  //  MockStackOverflowManagerDelegate * delegate = [[MockStackOverflowManagerDelegate alloc] init];
    manager.delegate = delegate;
 //   NSError * underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    [manager searchingForQuestionsFailedWithError:underlyingError];
    XCTAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError, @"The underlying error should be available to the client code");
}

-(void)testConfirmingObjectCanBeDelegate {
    //id <StackOverflowManagerDelegate> delegate = [[MockStackOverflowManagerDelegate alloc] init];
    XCTAssertNoThrow(manager.delegate = delegate, @"Object conforming to the delegate protocol should be used as the delegate");
}

-(void)testQuestionJSONIsPassedToQuestionBuilder {
    //FakeQuestionBuilder * builder = [[FakeQuestionBuilder alloc] init];
    manager.questionBuilder = builder;
    [manager receivedQuestionsJSON: @"Fake JSON"];
    
    XCTAssertEqualObjects(builder.JSON, @"Fake JSON", @"Downloaded JSON is sent to the builder");
    manager.questionBuilder = nil;
}

-(void)testDelegateNotifiedOfErrorWhenQuestionBuilderFailts {
   // FakeQuestionBuilder * builder = [[FakeQuestionBuilder alloc] init];
    builder.arrayToReturn = nil;
    builder.errorToSet = underlyingError;
    manager.questionBuilder = builder;
    [manager receivedQuestionsJSON:@"Fake JSON"];
    XCTAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], @"The delegate should have found out about the error");
    manager.questionBuilder = nil;
}

-(void)testDelegateNotToldAboutErrorWhenQuestionReceived {
    builder.arrayToReturn = questionArray;
    [manager receivedQuestionsJSON:@"Fake JSON"];
    XCTAssertNil([delegate fetchError], @"No error should be received on success");
}

-(void)testDelegateReceivesTheQuestionsDiscoveredByManager {
    builder.arrayToReturn = questionArray;
    [manager receivedQuestionsJSON:@"Fake JSON"];
    XCTAssertEqualObjects([delegate receivedQuestions], questionArray, @"The manager should have sent its questions to the delegate");
}


@end
