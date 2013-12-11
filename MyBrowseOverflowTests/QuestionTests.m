//
//  QuestionTests.m
//  MyBrowseOverflow
//
//  Created by Rian Fowler on 2013-12-07.
//  Copyright (c) 2013 Rian Fowler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"
#import "Answer.h"

@interface QuestionTests : XCTestCase {
    Question * question;
    Answer  * lowScore;
    Answer  * highScore;
    
}

@end

@implementation QuestionTests

- (void)setUp
{
    question = [[Question alloc] init];
    question.date = [NSDate distantPast];
    question.title = @"Question Title";
    question.score = 5;
    
    Answer * accepted = [[Answer alloc] init];
    accepted.score = 1;
    accepted.accepted = YES;
    [question addAnswer: accepted];
    
    lowScore = [[Answer alloc ] init];
    lowScore.score = -4;
    [question addAnswer: lowScore];
    
    highScore = [[Answer alloc] init];
    highScore.score = 4;
    [question addAnswer: highScore];

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

-(void)testQuestionCanHaveAnswersAdded {
    Answer * myAnswer = [[Answer alloc ] init];
    
    XCTAssertNoThrow([question addAnswer: myAnswer] , @"Must be able to add answers");
}

-(void)testAcceptedAnswerIsFirst {
    XCTAssertTrue([[question.answers objectAtIndex: 0] isAccepted], @"Accepted answer comes first");
}

-(void)testHighScoreAnswerBeforeLow {
    NSArray * answers = question.answers;
    NSInteger highIndex = [answers indexOfObject:highScore];
    NSInteger lowIndex = [answers indexOfObject:lowScore];
    
    XCTAssertTrue(highIndex < lowIndex, @"High scoring answer comes first");
}

- (void)tearDown
{
    question = nil;
    lowScore = nil;
    highScore = nil;
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}


@end
