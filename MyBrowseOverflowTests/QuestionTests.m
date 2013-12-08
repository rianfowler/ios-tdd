//
//  QuestionTests.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"

@interface QuestionTests : XCTestCase {
    Question * question;

}

@end

@implementation QuestionTests

- (void)setUp
{
    question = [[Question alloc] init];
    question.date = [NSDate distantPast];
    question.title = @"Question Title";
    question.score = 5;

    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

-(void)testQuestionHasADate {
    NSDate * testDate = [NSDate distantPast];
    XCTAssertEqualObjects(question.date, testDate, @"Question needs to provide its date");
}

-(void)testQuestionHasATitle {
    XCTAssertEqualObjects(question.title, @"Question Title", @"Question needs to have a title");
}

-(void)testQuestionHasAScore {
    XCTAssertEqual(question.score, 5, @"Question should have a vote score");
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}


@end
