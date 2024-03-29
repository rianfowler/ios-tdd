//
//  TopicTests.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"
#import "Question.h"

@interface TopicTests : XCTestCase {
    Topic * topic;
}

@end

@implementation TopicTests

- (void)setUp
{
    [super setUp];
    
    topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
    // Put setup code here; it will be run once, before the first test case.
}

-(void)testThatTopicExists {
    XCTAssertNotNil(topic, @"should be able to create a Topic instance");
}

-(void)testThatTopicCanBeNamed {
    XCTAssertEqualObjects(topic.name, @"iPhone", @"the Topic should have the name I gave it");
}

-(void)testThatTopicHasATag {
    XCTAssertEqualObjects(topic.tag, @"iphone", @"Topics needs to have tags");
}

-(void)testForAListOfQuestions {
    XCTAssertTrue([[topic recentQuestions] isKindOfClass:[NSArray class]], @"Topics should provide a list of recent questions");
}

-(void)testForInitiallyEmptyQuestionList {
    XCTAssertEqual([[topic recentQuestions] count], (NSUInteger)0, @"No questions added yet, count should be zero");
}

-(void)testAddingAQuestionToTheList {
    Question * question = [[Question alloc] init];
    [topic addQuestion: question];
    XCTAssertEqual([[topic recentQuestions] count], (NSUInteger)1, @"Add a question, and the count of questions should go up");
}

-(void)testQuestionsAreListedChronologically {
    Question *q1 = [[Question alloc] init];
    q1.date = [NSDate distantPast];
    
    Question *q2 = [[Question alloc] init];
    q2.date = [NSDate distantFuture];
    
    [topic addQuestion:q1];
    [topic addQuestion:q2];
    
    NSArray * questions = [topic recentQuestions];
    Question * listedFirst = [questions objectAtIndex:0];
    Question * listedSecond = [questions objectAtIndex:1];
    
    XCTAssertEqualObjects([listedFirst.date laterDate:listedSecond.date], listedFirst.date, @"The later quesiton should appear first in the list");
}

-(void)testLimitOfTwentyQuestions {
    Question *q1 = [[Question alloc] init];
    
    for (NSInteger i = 0; i < 25; i++) {
        [topic addQuestion:q1];
    }
    
    XCTAssertTrue([[topic recentQuestions] count] < 21, @"There should never be more than twenty questions");
}

- (void)tearDown
{
    topic = nil;
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

@end
